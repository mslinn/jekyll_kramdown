def require_directory(dir)
  Dir[File.join(dir, '*.rb')]&.sort&.each do |file|
    require file unless file == __FILE__
  end
end

require 'jekyll'
require 'jekyll_plugin_logger'
require 'jekyll_plugin_support'
require_directory __dir__
