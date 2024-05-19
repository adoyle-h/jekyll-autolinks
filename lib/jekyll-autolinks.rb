require 'jekyll'
require 'rinku'

Jekyll::Hooks.register :pages, :post_render do |page|
  if page.html?
    link_attr = page.site.config['autolinks']['link_attr']
    skip_tags = page.site.config['autolinks']['skip_tags']
    page.content = +Rinku.auto_link(page.content, :all, link_attr, skip_tags)
  end
end
