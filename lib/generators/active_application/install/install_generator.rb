module ActiveApplication
  module Generators
    class InstallGenerator < Rails::Generators::Base
      class_option :user_model,             type: :string, default: "User"
      class_option :authentication_engine,  type: :string, default: "devise"
      class_option :authorization_engine,   type: :string, default: "cancan"

      class_option :skip_clean,             type: :boolean, default: false
      class_option :skip_routes,            type: :boolean, default: false

      def clean_project
        unless options[:skip_clean]
          generate "active_application:clean"
        end
      end

      def install_authentication
        if options[:authentication_engine] == "devise"
          generate "active_application:devise #{options[:user_model].classify}"
        end
      end

      def install_authorization
        if options[:authorization_engine] == "cancan"
          generate "active_application:cancan #{options[:user_model].classify}"
        end
      end

      def add_routes
        unless options[:skip_routes] 
          sentinel = "::Application.routes.draw do"
          data = "active_application_routes"
          inject_into_file "config/routes.rb", "\n  #{data}", after: sentinel
        end
      end
    end
  end
end
