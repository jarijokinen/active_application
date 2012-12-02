module ActiveApplication
  module Generators
    class InstallGenerator < Rails::Generators::Base
      class_option :user_model,             type: :string, default: "User"
      class_option :authentication_engine,  type: :string, default: "devise"
      class_option :authorization_engine,   type: :string, default: "cancan"
      class_option :skip_routes,            type: :boolean, default: false

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
          inject_into_class "config/routes.rb", "  active_application_routes"
        end
      end
    end
  end
end
