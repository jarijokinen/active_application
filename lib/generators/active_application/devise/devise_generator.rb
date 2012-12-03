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
      
      def setup_model
        remove_file "app/models/#{self.devise_model.underscore}.rb"
        template "user.rb", "app/models/#{self.devise_model.underscore}.rb"
      end

      def setup_seeds
        remove_file "db/seeds.rb"
        template "seeds.rb", "db/seeds.rb"
      end

      def setup_migrations
        migration_file = Dir["db/migrate/*create_#{self.devise_model.tableize}.rb"][0]
        gsub_file migration_file, "# t.string   :confirm", "t.string   :confirm"
        gsub_file migration_file, "# t.datetime :confirm", "t.datetime :confirm"
        gsub_file migration_file, "# t.string   :unconfirm", "t.string   :unconfirm"
        gsub_file migration_file, "# add_index :#{self.devise_model.tableize}, :confirm", 
          "add_index :#{self.devise_model.tableize}, :confirm"
      end
    end
  end
end
