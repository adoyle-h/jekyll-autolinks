require 'jekyll'
require 'rinku'

Jekyll::Hooks.register :pages, :post_render do |page|
  link_attr = page.site.config['autolinks']['link_attr']
  skip_tags = page.site.config['autolinks']['skip_tags']
  page.output = Rinku.auto_link(page.output, :all, link_attr, skip_tags)
end
