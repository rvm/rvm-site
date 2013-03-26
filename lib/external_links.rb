require "typhoeus"

Nanoc::Extra::Checking::Checks.send(:remove_const, :ExternalLinks)
module Nanoc::Extra::Checking::Checks
  class ExternalLinks < Nanoc::Extra::Checking::Check
    identifiers :external_links, :elinks
    @count = 4

    class << self
      attr_accessor :count
    end

    def run
      hrefs =
        Nanoc::Extra::LinkCollector.new(
          self.output_filenames.select { |f|
            File.extname(f) == ".html"
          }, :external
        ).filenames_per_href

      list = hrefs.keys.select { |u| u =~ %r!https?://! }
      self.find_invalid(list).each do |l|
        filenames = hrefs[l]
        filenames.map do |f|
          self.add_issue("#{l} is broken, fix it", subject: f)
        end
      end
    end

    def find_invalid(hrefs)
      self.count.times do |i|
        hydra = Typhoeus::Hydra.new(max_concurrency: 20)
        hrefs.each do |l|
          hydra.queue(
            req =
              Typhoeus::Request.new(
                l, method: :head, followlocation: true)
          )

          req.on_complete do |r|
            if [200, 301, 302].include?(r.response_code)
              hrefs.delete(l)
            end
          end
        end

        hydra.run

        if i < self.count
          (hrefs.empty?) ? break : sleep(i * 5)
        end
      end

      hrefs
    end
  end
end
