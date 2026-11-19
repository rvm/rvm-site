# Documentation index, shared by the docs sidebar and the home page index.
#
# Each group is either built from the items under a path (like `menu_for`) or
# listed by hand for sections whose children are external or unrouted.
module NavHelper
  PRESENTATIONS = [
    ['MWRC 2010', 'http://www.confreaks.com/videos/3-mwrc2010-managing-ruby-projects-with-rvm'],
    ['RailsConf 2012', 'http://confreaks.tv/videos/railsconf2012-rvm-essential-rails-development-tools'],
    ['RailsConf 2013', 'http://confreaks.tv/videos/railsconf2013-developing-rails-apps-in-technical-isolation'],
    ['Changelog 66 with Wayne', 'http://thechangelog.com/66/'],
    ['RVM 2: Lessons and future', 'http://www.youtube.com/watch?v=wN-iIC3S1ZM'],
    ['RVM 2: Python Version Manager', 'http://www.youtube.com/watch?v=gYNht8H24ZQ'],
    ['Changelog 102 with Michal', 'http://thechangelog.com/102/'],
  ].freeze

  DOC_GROUPS = [
    { path: '/rvm/' },
    { title: 'Interpreters', href: '/interpreters/', links: [
      ['MRI/YARV (ruby)', '/interpreters/ruby/'],
      ['JRuby (jruby)', '/interpreters/jruby/'],
      ['Rubinius (rbx)', '/interpreters/rbx/'],
    ] },
    { path: '/rubies/' },
    { path: '/gemsets/' },
    { title: 'Set Actions', href: '/set/', links: [
      ['do', '/set/do/'],
      ['tests', '/set/tests/'],
      ['benchmark', '/set/benchmark/'],
    ] },
    { path: '/workflow/' },
    { path: '/deployment/' },
    { path: '/integration/' },
    { title: 'Packages', href: '/packages/', links: [] },
    { title: 'Presentations', href: '/presentations/', links: PRESENTATIONS },
    { title: 'Help & Support', href: '/support/', links: [
      ['Issues tracker', '/support/irc/'],
      ['FAQ & Notes', '/support/faq/'],
      ['Troubleshooting', '/support/troubleshooting/'],
      ['Fixing Broken SSL Certificates', '/support/fixing-broken-ssl-certificates/'],
    ] },
    { path: '/qa/' },
    { path: '/development/' },
    { title: 'Credits', href: '/credits/', links: [
      ['Contributions', '/credits/thanks/'],
      ['Donations', '/credits/donations/'],
      ['Funding', '/credits/funding/'],
    ] },
  ].freeze

  # Resolves every group to { title:, href:, links: [[name, href], ...] }.
  def doc_groups
    @doc_groups ||= DOC_GROUPS.map do |group|
      next group unless group[:path]

      item = find_item(group[:path])
      {
        title: menu_name(item),
        href: group[:path],
        links: items_for(group[:path], {}).map { |child| [menu_name(child), child.path] },
      }
    end
  end

  def menu_name(item)
    return item[:menu_title] if item[:menu_title]

    (item.path || item.identifier.to_s).split('/').last.tr('-', ' ').gsub(/\w+/, &:capitalize)
  end

  def current_path?(href)
    @item.path == href
  end

  def current_group?(group)
    path = @item.path.to_s
    path.start_with?(group[:href]) || group[:links].any? { |_, href| href == path }
  end

  def nav_link(name, href)
    current = current_path?(href) ? ' aria-current="page"' : ''
    %(<a href="#{h href}"#{current}>#{h name}</a>)
  end

  # The docs sidebar: one <details> per group, the current group open.
  def doc_sidebar
    doc_groups.map do |group|
      open = current_group?(group) ? ' open' : ''
      links = group[:links].map { |name, href| "<li>#{nav_link(name, href)}</li>" }.join
      list = links.empty? ? '' : %(<ul>#{links}</ul>)
      if list.empty?
        %(<p class="toc__solo">#{nav_link(group[:title], group[:href])}</p>)
      else
        <<~HTML
          <details class="toc__group"#{open}>
            <summary>#{h group[:title]}</summary>
            <p class="toc__overview">#{nav_link('Overview', group[:href])}</p>
            #{list}
          </details>
        HTML
      end
    end.join("\n")
  end

  # The home page index: every group open, laid out in columns.
  def doc_index
    doc_groups.map do |group|
      links = group[:links].map { |name, href| %(<li><a href="#{h href}">#{h name}</a></li>) }.join
      <<~HTML
        <div class="index__group">
          <h3><a href="#{h group[:href]}">#{h group[:title]}</a></h3>
          #{links.empty? ? '' : "<ul>#{links}</ul>"}
        </div>
      HTML
    end.join("\n")
  end
end

use_helper NavHelper
