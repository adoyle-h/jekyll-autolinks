require 'helper'

class Jekyll::AutolinksTest < Minitest::Test
  context 'Autolinks' do
    setup do
      @site = Jekyll::Site.new(Jekyll::Configuration::DEFAULTS.dup)
      @autolinks = Jekyll::Autolinks.new(@site.config)
      @page = Jekyll::Page.new(@site, File.expand_path('../../', __FILE__), '', 'README.md')
      @page.instance_variable_set(:@content, '<div>hi@gmail.com</div>')
      @site.pages << @page
      @email_link = '<div><a href="mailto:hi@gmail.com">hi@gmail.com</a></div>'
    end

    should 'replace https url with link' do
      @page.instance_variable_set(:@content, 'https://123.com')
      @autolinks.instance_variable_set(:@site, @site)
      @autolinks.send(:autolinkify, @page)
      assert_equal '<a href="https://123.com">https://123.com</a>', @page.content
    end

    should 'replace http url with link' do
      @page.instance_variable_set(:@content, 'http://123.com')
      @autolinks.instance_variable_set(:@site, @site)
      @autolinks.send(:autolinkify, @page)
      assert_equal '<a href="http://123.com">http://123.com</a>', @page.content
    end

    should 'replace url with link (with link_attr)' do
      @autolinks = Jekyll::Autolinks.new(@site.config)
      @site.config['autolinks']['link_attr'] = 'target="_blank" class="my-link"'
      @page.instance_variable_set(:@content, 'http://123.com')
      @autolinks.instance_variable_set(:@site, @site)
      @autolinks.send(:autolinkify, @page)
      assert_equal '<a href="http://123.com" target="_blank" class="my-link">http://123.com</a>', @page.content
    end

    should 'replace email with link' do
      @autolinks.instance_variable_set(:@site, @site)
      @autolinks.send(:autolinkify, @page)
      assert_equal @email_link, @page.content
    end

    should 'replace page content on generate' do
      @autolinks.generate(@site)
      assert_equal @email_link, @page.content
    end

    should 'replace page content on site#generate' do
      @site.generators = Array(@autolinks)
      @site.generate
      assert_equal @email_link, @page.content
    end

    should 'pull link_attr from config' do
      @site.config['autolinks']['link_attr'] = 'class="ivan"'
      @autolinks.generate(@site)
      assert @page.content.include?('class="ivan"')
    end

    should 'pull skip_tags from config' do
      @site.config['autolinks']['skip_tags'] = 'div'
      @autolinks.generate(@site)
      assert_equal '<div>hi@gmail.com</div>', @page.content
    end

    should 'not replace email with link if page is not html' do
      @page = Jekyll::Page.new(@site, File.expand_path('../../', __FILE__), '', 'LICENSE')
      @page.instance_variable_set(:@content, '<div>adoyle.h@gmail.com</div>')
      @site.pages << @page
      @autolinks.generate(@site)
      assert_equal '<div>adoyle.h@gmail.com</div>', @page.content
    end
  end
end
