# encoding: utf-8

module CodeHelper

  def sh_cmd(command)
    "<pre class='code code-shell-cmd' title='triple click to select command'>#{html_escape command}</pre>"
  end

  def li_code(code, text)
    "<li><code>#{html_escape code}</code> - #{text}</li>"
  end

  def items_for(path, options)
    @items.select { |item|
      (! item[:menu_ignore] || options[:show_ignored] )  &&
      Regexp.new("^#{path}.+").match(item.path || item.identifier.to_s)
    }.sort_by{ |item|
      (item.path || item.identifier.to_s)
    }
  end

  def link_in_menu(item)
    if
      item[:menu_title]
    then
      name = item[:menu_title]
    else
      name = (item.path || item.identifier.to_s).split("/").last
      name = name.gsub(/-/, " ").gsub(/\w+/) { |w| w.capitalize }
    end
    link_to(name, item)
  end

  def find_item(path)
    @items.find { |item| item.path == path }
  end

  def menu_for(path, options = {})
    wrapper = options[:wrapper]
    content = link_in_menu(find_item(path))
    content = "<#{wrapper}>#{content}</#{wrapper}>" if wrapper
    content += "\n"
    content +=
    "<ul>#{items_for(path, options).map { |item| "<li>#{link_in_menu(item)}</li>" }.join("\n")}</ul>"
    content
  end

end

use_helper Nanoc::Helpers::HTMLEscape
use_helper CodeHelper
