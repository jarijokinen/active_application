module ActiveApplication
  module Generators
    class DeviseGenerator < Rails::Generators::Base
      argument :devise_model, type: :string, default: "User"

      def self.source_root
        @source_root ||= File.join(File.dirname(__FILE__), "templates")
      end

      def install_devise
        generate "devise:install --quiet"
      end

      def generate_model
        generate "active_record:devise #{self.devise_model.classify}"
      end

      def setup_seeds
        remove_file "db/seeds.rb"
        template "seeds.rb", "db/seeds.rb"
      end

#      def add_route
#        route "devise_for :#{self.devise_model.tableize}"
#      end

      def setup_model
        model_file = "app/models/#{self.devise_model.underscore}.rb"
#        gsub_file model_file, ":rememberable", ":confirmable"
#        gsub_file model_file, ", :remember_me", ""
      end

#      def setup_initializer
#        initializer_file = "config/initializers/devise.rb"
#        gsub_file initializer_file,
#          /config\.mailer_sender = .+$/,
#          'config.mailer_sender = "info@example.com"'
#      end

#      def setup_migrations
#        migration_file =
#          Dir["db/migrate/*create_#{self.devise_model.tableize}.rb"][0]
#        gsub_file migration_file, "t.rememberable", "# t.rememberable"
#        gsub_file migration_file, "# t.confirmable", "t.confirmable"
#        gsub_file migration_file,
#          "# add_index :#{self.devise_model.tableize}, :confirmation_token",
#          "add_index :#{self.devise_model.tableize}, :confirmation_token"
#      end
    end
  end
end
