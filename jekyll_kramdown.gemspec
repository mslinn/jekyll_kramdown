require_relative 'lib/jekyll_kramdown/version'

Gem::Specification.new do |spec|
  host = 'https://github.com/mslinn/jekyll_kramdown'

  spec.authors               = ['Mike Slinn']
  spec.description           = <<~END_DESC
    Write a longer description of the gem.
    Use as many lines as you like.
  END_DESC
  spec.email                 = ['mslinn@mslinn.com']
  spec.files                 = Dir['.rubocop.yml', 'LICENSE.*', 'Rakefile', '{lib,spec}/**/*', '*.gemspec', '*.md']
  spec.homepage              = host
  spec.license               = 'MIT'
  spec.metadata = {
    'allowed_push_host' => 'https://rubygems.org',
    'bug_tracker_uri'   => "#{host}/issues",
    'changelog_uri'     => "#{host}/CHANGELOG.md",
    'homepage_uri'      => spec.homepage,
    'source_code_uri'   => host,
  }
  spec.name                 = 'jekyll_kramdown'
  spec.platform             = Gem::Platform::RUBY
  spec.post_install_message = <<~END_MESSAGE

    Thanks for installing #{spec.name}!

  END_MESSAGE
  spec.require_paths         = ['lib']
  spec.required_ruby_version = '>= 3.1.0'
  spec.summary               = 'Write summary of what the gem is for'
  spec.version               = JekyllKramdown::VERSION

  spec.add_dependency 'jekyll', '>= 4.4.0'
  spec.add_dependency 'jekyll_draft'
  spec.add_dependency 'jekyll_plugin_support', '>= 3.1.0'
  spec.add_dependency 'logger'
end
