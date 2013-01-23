require "cancan"
require "devise-formtastic"
require "formtastic-bootstrap"
require "has_scope"
require "jquery-rails"
require "kaminari"
require "less-rails"
require "modernizr"
require "rolify"
require "simple_resource"
require "stringex"
require "twitter-bootstrap-rails"
require "active_application/configuration"
require "active_application/engine"
require "active_application/controller_methods"
require "active_application/routes"
require "active_application/version"

module ActiveApplication
  include Configuration
  ActionDispatch::Routing::Mapper.send(:include, ActiveApplication::Routes)
end
