require "cancan"
require "devise"
require "formtastic-bootstrap"
require "has_scope"
require "jquery-rails"
require "kaminari"
require "less-rails"
require "modernizr-rails"
require "simple_resource"
require "twitter-bootstrap-rails"
require "active_application/engine"
require "active_application/routes"
require "active_application/version"

unless Rails.env.production?
  require "factory_girl_rails"
end

module ActiveApplication
  ActionDispatch::Routing::Mapper.send(:include, ActiveApplication::Routes)
end
