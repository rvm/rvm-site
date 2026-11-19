class RvmIssuesFilter < Nanoc::Filter
  identifier :rvm_issues
  type :text
  def run(content, params={})
    content.
      gsub(/RVM#([0-9]+) (.*)$/) do
        "<a href=\"https://github.com/rvm/rvm/issues/#{$1}\">RVM##{$1} #{$2}</a>"
      end
  end
end

module BlogHelper

  def get_pretty_date(post)
    attribute_to_time(post[:created_at]).strftime('%B %-d, %Y')
  end

  def get_post_link(post, options = {})
    options_with = Array(options[:with])
    link_name = []
    link_name << get_pretty_date(post) if options_with.include?(:date)
    link_name << post[:title]
    link_to("#{link_name.join(" - ")}", post)
  end

  def get_author_link(post)
    link_to(post[:author_full]||post[:author], "/authors/#{post[:author]}")
  end

  def get_post_start(post)
    content = post.compiled_content
    if content =~ /<!-- more -->/
      content = content.partition('<!-- more -->').first.strip +
      "<a href='#{post.path}' class='read-more'>Continue reading &rsaquo;</a>"
    end
    return content
  end

  def get_tag_link(tag)
    link_to(tag, "/tags/#{tag}")
  end

  def get_tag_links(post)
    "Tagged #{post[:tags].map { |tag| get_tag_link(tag) }.join(", ")}"
  end

  def get_post_meta(post)
    meta = []
    posted = []
    if post[:created_at]
      time = attribute_to_time(post[:created_at])
      posted << %(Posted <time datetime="#{time.strftime('%F')}">#{get_pretty_date(post)}</time>)
    end
    posted << "by #{get_author_link(post)}" if post[:author]
    meta << "<span>#{posted.join(' ')}</span>" unless posted.empty?
    meta << %(<span class="post__tags">#{get_tag_links(post)}</span>) if post[:tags] && !post[:tags].empty?
    meta.join(" ")
  end

  def links_for_articles(options = {})
    articles_for(options).map{|post| "<li>#{get_post_link(post, options)}</li>" }.join("\n")
  end

  def articles_for(options = {})
    tag = options[:tag]
    author = options[:author]
    items = sorted_articles
    items.select! { |item| item[:tags] and item[:tags].include?(tag) } if tag
    items.select! { |item| item[:author] and item[:author] == author } if author
    items
  end

  def add_feed_link
    file1 = File.exist?("#{Dir.pwd}/content#{@item.identifier.to_s}feed.haml")
    file2 = File.exist?("#{Dir.pwd}/content#{@item.identifier.to_s.sub(/\/$/,"_")}feed.haml")
    "<link href=\"#{feed_url}feed.xml\" rel=\"alternate\" title=\"#{@item.identifier} atom feed\" type=\"application/atom+xml\">" if file1 || file2
  end

end

use_helper BlogHelper
