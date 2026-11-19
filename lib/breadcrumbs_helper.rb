module BreadcrumbsHelper

  def breadcrumbs(*names)
    path = @item.identifier.to_s
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
use_helper Nanoc::Helpers::LinkTo
use_helper BreadcrumbsHelper
