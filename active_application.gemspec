# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'active_application/version'

Gem::Specification.new do |gem|
  gem.name          = "active_application"
  gem.version       = ActiveApplication::VERSION
  gem.authors       = ["Jari Jokinen"]
  gem.email         = ["info@jarijokinen.com"]
  gem.description   = "Application framework for Rails"
  gem.summary       = "Application framework for Rails"
  gem.homepage      = "https://github.com/jarijokinen/active_application"

  gem.files         = `git ls-files`.split($/)
  gem.test_files    = gem.files.grep(%r{^spec/})
  gem.require_paths = ["lib"]

  gem.add_dependency "rails", "~> 3.2.9"
  gem.add_dependency "cancan", "~> 1.6.8"
  gem.add_dependency "devise", "~> 2.1.2"
  gem.add_dependency "formtastic-bootstrap", "~> 2.0.0"
  gem.add_dependency "has_scope", "~> 0.5.1"
  gem.add_dependency "kaminari", "~> 0.14.1"
  gem.add_dependency "less-rails", "~> 2.2.6"
  gem.add_dependency "modernizr-rails", "~> 2.6.1"
  gem.add_dependency "simple_resource", "~> 0.1.0"
  gem.add_dependency "therubyracer", "~> 0.10.2"
  gem.add_dependency "twitter-bootstrap-rails", "~> 2.1.6"

  gem.add_development_dependency "capybara", "~> 2.0.1"
  gem.add_development_dependency "database_cleaner", "~> 0.9.1"
  gem.add_development_dependency "factory_girl_rails", "~> 4.1.0"
  gem.add_development_dependency "forgery", "~> 0.5.0"
  gem.add_development_dependency "guard-rspec", "~> 2.3.0"
  gem.add_development_dependency "guard-spork", "~> 1.4.0"
  gem.add_development_dependency "launchy", "~> 2.1.2"
  gem.add_development_dependency "rb-inotify", "~> 0.8.8"
  gem.add_development_dependency "rspec-rails", "~> 2.12.0"
  gem.add_development_dependency "spork-rails", "~> 3.2.0"
  gem.add_development_dependency "sqlite3", "~> 1.3.6"
end
