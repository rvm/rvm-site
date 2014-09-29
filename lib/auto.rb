require 'pathname'

class AutoHelper
  attr_reader :root, :site, :tags, :authors

  def initialize(root, site)
    @root = Pathname(root)
    @site = site
    @tags = []
    @authors = {}
  end

  def parse_tags(item)
    item.attributes[:tags].each { |tag| @tags << tag unless @tags.include?(tag) }
  end

  def parse_author(item)
    authors[item.attributes[:author]] = item.attributes[:author_full]
  end

  def parse_site
    site.items.each do |item|
      parse_tags  (item) if item.attributes[:tags]
      parse_author(item) if item.attributes[:author]
    end
  end

  def write_file(file, content)
    file.open('w') { |file| file.write(content) }
  end

  def render_layout(layout_name, mapping = {})
    layout = @site.layouts.find { |l| l.identifier == layout_name.cleaned_identifier }
    filter = Nanoc::Filter.named('erb').new(mapping)
    filter.run(layout.raw_content)
  end

  def create_tag_page(tag_page, tag)
    write_file(tag_page, render_layout("templates/tag_page", tag: tag))
  end

  def create_tag_feed(feed_page, tag)
    #TODO
  end

  def ensure_tag_page(tags_dir, tag)
    tag_page  = tags_dir + "#{tag}.haml"
    feed_page = tags_dir + "#{tag}_feed.haml"

    create_tag_page(tag_page, tag)  unless tag_page.exist?
    create_tag_feed(feed_page, tag) unless feed_page.exist?
  end

  def ensure_tag_pages
    tags_dir  = root + 'content' + 'tags'
    tags_dir.mkpath

    tags.each do |tag|
      ensure_tag_page(tags_dir, tag)
    end
  end

  def create_author_page(author_page, author, author_full)
    write_file(author_page, render_layout("templates/author_page", author: author, author_full: author_full))
  end

  def create_author_feed(feed_page,   author, author_full)
    #TODO
  end

  def ensure_author_page(authors_dir, author, author_full)
    author_page = authors_dir + "#{author}.haml"
    feed_page   = authors_dir + "#{author}_feed.haml"

    create_author_page(author_page, author, author_full) unless author_page.exist?
    create_author_feed(feed_page,   author, author_full) unless feed_page.exist?
  end

  def ensure_author_pages
    authors_dir  = root + 'content' + 'authors'
    authors_dir.mkpath

    authors.each_pair do |author, author_full|
      ensure_author_page(authors_dir, author, author_full)
    end
  end

  def auto
    parse_site
    ensure_tag_pages
    ensure_author_pages
  end
end
