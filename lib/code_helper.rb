# encoding: utf-8

module CodeHelper

  def sh_cmd(command)
    "<pre class='code'>$ #{html_escape command}</pre>"
  end

  def li_code(code, text)
    "<li><code>#{html_escape code}</code> - #{text}</li>"
  end

end

include Nanoc3::Helpers::HTMLEscape
include CodeHelper
