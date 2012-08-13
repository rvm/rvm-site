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
