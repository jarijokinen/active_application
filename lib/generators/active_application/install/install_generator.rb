module ActiveApplication
  module Generators
    class InstallGenerator < Rails::Generators::Base
      class_option :user_model,             type: :string, default: "User"
      class_option :authentication_engine,  type: :string, default: "devise"
      class_option :authorization_engine,   type: :string, default: "cancan"

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
    end
  end
end
