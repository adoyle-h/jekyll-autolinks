require 'jekyll'
require 'rinku'

Jekyll::Hooks.register :pages, :post_render do |page|
  if not page.html?
    return
  end

  link_attr = site.config['autolinks']['link_attr']
  skip_tags = site.config['autolinks']['skip_tags']
  page.content = +Rinku.auto_link(page.content, :all, link_attr, skip_tags)
end
