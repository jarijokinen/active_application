module ActiveApplication
  module Generators
    class RoutesGenerator < Rails::Generators::Base
      def setup_routes
        sentinel = "::Application.routes.draw do"
        data = "active_application_routes"
        inject_into_file "config/routes.rb", "\n  #{data}", after: sentinel
      end
    end
  end
end
