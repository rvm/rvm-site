module BreadcrumbsHelper

  def breadcrumbs(*names)
    path = @item.identifier
    names.unshift "Documentation"
    parts = path.split("/")
    html = []
    parts.inject([]) do |acc, current|
      acc << current
      url = "#{acc.join('/')}/"
      html << link_to(names.shift, url)
      acc
    end
    html *= "&nbsp;&gt;&nbsp;"
    %(<div class='breadcrumbs'>#{html}<hr /></div>)
  end

end
include Nanoc3::Helpers::LinkTo
include BreadcrumbsHelper
