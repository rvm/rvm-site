module BreadcrumbsHelper

  def breadcrumbs(path, *names)
    names.unshift "Documentation"
    parts = path.split("/")
    html = []
    parts.inject([]) do |acc, current|
      acc << current
      url = "#{acc.join('/')}/"
      html << %(<a href='#{url}'>#{names.shift}</a>)
      acc
    end
    html *= "&nbsp;&gt;&nbsp;"
    %(<div class='breadcrumbs'>#{html}</div>)
  end

end
include BreadcrumbsHelper
