require 'jekyll'
require 'rinku'

module Jekyll
  class Autolinks < Jekyll::Generator
    safe true

    def initialize(config)
      config['autolinks'] ||= {}
    end

    def generate(site)
      @site = site
      site.pages.each { |page| autolinkify page if page.html?}
      site.posts.docs.each { |page| autolinkify page }
    end

    private

    def autolinkify(page)
      page.content = +Rinku.auto_link(page.content, :all, link_attr, skip_tags)
    end

    def link_attr
      @link_attr ||= @site.config['autolinks']['link_attr']
    end

    def skip_tags
      @skip_tags ||= Array(@site.config['autolinks']['skip_tags'])
    end
  end
end
