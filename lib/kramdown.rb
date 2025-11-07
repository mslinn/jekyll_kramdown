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

    def initialize(tag_name, argument_string, parse_context)
      class << self
        include NoArgParsing
      end

      super
      @logger.debug { "#{self.class}: respond_to?(:no_arg_parsing) #{respond_to?(:no_arg_parsing) ? 'yes' : 'no'}." }
    rescue StandardError => e
      @logger.error { "#{self.class} died with a #{e.full_message}" }
      exit 2
    end

    # @return [string] markup to be rendered on web page
    def render_impl(content)
      # Put your plugin logic here and modify the following return value.

      <<~HEREDOC
        <pre class="example">
          content = '#{content}'
          This is the kramdown block tag output.
        </pre>
      HEREDOC
    rescue StandardError => e
      @logger.error { "#{self.class} died with a #{e.full_message}" }
      exit 3
    end

    ::JekyllSupport::JekyllPluginHelper.register(self, PLUGIN_NAME)
  end
end
