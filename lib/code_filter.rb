require 'nanoc3'

class PreCodeFilter < Nanoc3::Filter
  identifier :pre_code
  type :text
  def run(content, params={})
    content.
      gsub(/<pre><code>(.*?)(\n?)<\/code><\/pre>/m) do |match|
        "<pre class=\"code\">#{$1.gsub(/\n/,"&#x000A;")}</pre>"
      end
  end
end

class AutoIdsFilter < Nanoc3::Filter
  identifier :auto_ids
  type :text
  def run(content, params={})
    content.
      gsub(/(<h[123]>)(.*?)(<\/h[123]>)/m) do |match|
        __start = $1
        __content = $2.strip
        __end = $3
        if
          __content =~ /^(<a href=".*">)(.*<\/a>)$/m
        then
          "#{__start}#{$1}&infin;#{$2}#{__end}"
        else
          __id = create_id(__content)
          "#{__start}<a class=\"anchor\" href=\"##{__id}\" name=\"#{__id}\">&infin;</a>#{__content}#{__end}"
        end
      end
  end
  def create_id(content)
    content
      .downcase           # small leters
      .gsub(/<.*?>/,'')          # remove tags
      .gsub(/[^[:alnum:] -]/,"") # only chars, numbers, spaces and dash
      .gsub(/[ ]/, "-")          # convert spaces to dashes
      .gsub(/-+/, "-")           # convert multiple dashes to single
  end
end
