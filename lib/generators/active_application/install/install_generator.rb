module ActiveApplication
  module Generators
    class InstallGenerator < Rails::Generators::Base
      class_option :authentication_engine,  type: :string, default: "devise"
      class_option :authorization_engine,   type: :string, default: "cancan"
      class_option :session_store,          type: :string, default: "active_record"
      class_option :test_framework,         type: :string, default: "rspec"
      class_option :user_model,             type: :string, default: "User"

      class_option :skip_bundle,            type: :boolean, default: false
      class_option :skip_clean,             type: :boolean, default: false
      class_option :skip_routes,            type: :boolean, default: false

      def clean_project
        unless options[:skip_clean]
          generate "active_application:clean"
        end
      end

      def setup_bundle
        unless options[:skip_bundle]
          generate "active_application:bundle"
        end
      end

      def setup_session_store
        if options[:session_store] == "active_record"
          generate "active_application:active_record_store"
        end
      end

      def setup_test_framework
        if options[:test_framework] == "rspec"
          generate "active_application:rspec"
        end
      end

      def setup_authentication
        if options[:authentication_engine] == "devise"
          generate "active_application:devise #{options[:user_model].classify}"
        end
      end

      def setup_authorization
        if options[:authorization_engine] == "cancan"
          generate "active_application:cancan #{options[:user_model].classify}"
        end
      end

      def setup_routes
        unless options[:skip_routes] 
          generate "active_application:routes"
        end
      end
    end
  end
end
