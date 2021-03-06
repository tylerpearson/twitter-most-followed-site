require 'digest'

module Jekyll
  class Percentage < Liquid::Tag
    def initialize(tag_name, params, tokens)
       super
    end

    def render(context)
      @percentage = ((context['group.following_count'].to_f / context['site.data[page.results].list_length'].to_f) * 100).round(1)
      "#{@percentage}"
    end
  end
end

Liquid::Template.register_tag('percentage', Jekyll::Percentage)
