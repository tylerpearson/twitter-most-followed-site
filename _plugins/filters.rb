require 'digest'

module Jekyll
  class Percentage < Liquid::Tag
    def initialize(tag_name, params, tokens)
       super
    end

    def render(context)
      @percentage = ((context['group.following_count'].to_f / context['page.total_count_accounts'].to_f) * 100).round(1)
      "#{@percentage}"
    end
  end

  # Jekyll assets cachebuster filter
  #
  # Place this file into `_plugins`.
  module CachebusterFilter
    # Usage example:
    #
    # {{ "/style.css" | cachebuster }}
    # {{ "/style.css" | cachebuster | absolute_url }}
    def cachebuster(filename)
      sha256 = Digest::SHA256.file(
        File.join(@context.registers[:site].dest, filename)
      )

      "#{filename}?#{sha256.hexdigest[0, 6]}"
    rescue
      # Return filename unmodified if file was not found
      filename
    end
  end
end


Liquid::Template.register_filter(Jekyll::CachebusterFilter)
Liquid::Template.register_tag('percentage', Jekyll::Percentage)
