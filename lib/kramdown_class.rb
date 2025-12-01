require 'jekyll'
require 'jekyll_plugin_support'
require 'helper/jekyll_plugin_helper'
require_relative 'jekyll_kramdown_module'
require_relative 'jekyll_kramdown/version'

# See https://www.mslinn.com/jekyll/10200-jekyll-plugin-background.html
# See https://www.mslinn.com/jekyll/10400-jekyll-plugin-template-collection.html
#
# @example Heading for this example
#   {% kramdown %}
#     Content here
#   {% endkramdown %}
#
# The Jekyll log level defaults to :info, which means all the Jekyll.logger statements below will not generate output.
# You can control the log level when you start Jekyll.
# To set the log level to :debug, write an entry into _config.yml, like this:
# plugin_loggers:
#   Kramdown: debug
#
module JekyllKramdown
  JekyllKramdownError = ::JekyllSupport.define_error unless const_defined?(:JekyllKramdownError)

  PLUGIN_NAME = 'kramdown'.freeze unless defined? PLUGIN_NAME

  # This class implements the Jekyll block tag functionality
  class Kramdown < JekyllSupport::JekyllBlock
    # Defines class methods, see https://mslinn.com/jekyll/10700-designing-for-testability.html:
    extend JekyllKramdownModule

    VERSION = JekyllKramdown::VERSION

    # @return [string] markup to be rendered on web page
    def render_impl(content)
      @klass = @helper.parameter_specified?('class')
      @no_auto_ids        = @helper.parameter_specified?('no_auto_ids') || false
      @hard_wrap          = @helper.parameter_specified?('hard_wrap')    || false
      @input              = @helper.parameter_specified?('input')        || 'GFM'
      @math_engine        = @helper.parameter_specified?('math_engine')  || 'katex'
      @maxOneScreenHigh   = @helper.parameter_specified?('maxOneScreenHigh')
      @style              = @helper.parameter_specified?('style')
      @syntax_highlighter = @helper.parameter_specified?('syntax_highlighter')

      kramdown_doc = JekyllKramdownModule.markdownify(
        content,
        auto_ids:           !@no_auto_ids,
        hard_wrap:          @hard_wrap,
        input:              @input,
        math_engine:        @math_engine,
        syntax_highlighter: @syntax_highlighter
      )
      html = kramdown_doc.to_html
      @klass = " class='#{@klass}'" if @klass
      @style = " style='#{@style}'" if @style
      if @maxOneScreenHigh
        "<div#{@klass}#{@style}><div class='maxOneScreenHigh'>#{html}</div></div>"
      else
        @klass || @style ? "<div#{@klass}#{@style}>#{html}</div>" : html
      end
    rescue StandardError => e
      @logger.error { "#{self.class} died with a #{e.full_message}" }
      exit 3
    end

    ::JekyllSupport::JekyllPluginHelper.register(self, PLUGIN_NAME)
  end
end
