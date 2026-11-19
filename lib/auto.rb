require 'erb'
require 'pathname'

# Generates tag and author listing pages (plus their Atom feeds) for every tag
# and author found in the content. Pages are written to content/ once and are
# then tracked in git like any other page; existing files are never touched.
class AutoHelper
  attr_reader :root, :items, :layouts, :tags, :authors

  def initialize(root, items, layouts)
    @root = Pathname(root)
    @items = items
    @layouts = layouts
    @tags = []
    @authors = {}
  end

  def auto
    parse_items
    ensure_pages('tags', tags.map { |tag| [tag, { tag: tag }] }, 'tag_page', 'tag')
    ensure_pages(
      'authors',
      authors.map { |author, full| [author, { author: author, author_full: full }] },
      'author_page',
      'author'
    )
  end

  private

  def parse_items
    items.each do |item|
      Array(item[:tags]).each { |tag| @tags << tag unless @tags.include?(tag) }
      @authors[item[:author]] = item[:author_full] if item[:author]
    end
  end

  def ensure_pages(dir_name, entries, page_template, feed_type)
    dir = root + 'content' + dir_name
    dir.mkpath

    entries.each do |name, vars|
      page = dir + "#{name}.haml"
      feed = dir + "#{name}_feed.haml"
      page.write(render_template(page_template, vars)) unless page.exist?
      feed.write(render_template('feed', type: feed_type, filter: name)) unless feed.exist?
    end
  end

  def render_template(name, vars)
    layout = layouts["/templates/#{name}/"]
    ERB.new(layout.raw_content).result_with_hash(vars)
  end
end
