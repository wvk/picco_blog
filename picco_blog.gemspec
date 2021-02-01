$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "picco_blog/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "picco_blog"
  s.version     = PiccoBlog::VERSION
  s.authors     = ["Brandon Bango", "Willem van Kerkhof"]
  s.email       = ["brandon@acentrosys.com", "wvk@consolving.de"]
  s.homepage    = "https://github.com/wvk/picco_blog"
  s.summary     = "PiccoBlog is a simple Ruby on Rails markdown blog engine."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", ">= 4.2.4"
  s.add_dependency 'acts-as-taggable-on'
  s.add_dependency 'kaminari'
  s.add_dependency 'friendly_id', '>= 5.1.0'
  s.add_dependency 'redcarpet'
  s.add_dependency 'dragonfly', '>= 1.1.1'
  s.add_dependency 'mime-types'
  s.add_dependency 'awesome_nested_set', '~> 3.1'

  s.add_development_dependency 'sqlite3'
  s.add_development_dependency 'minitest'
  s.add_development_dependency 'capybara'
end
