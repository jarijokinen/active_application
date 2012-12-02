module ActiveApplication
  module Generators
    class ActiveRecordStoreGenerator < Rails::Generators::Base
      def setup_active_record_store
        gsub_file "config/initializers/session_store.rb", ":cookie_store", ":active_record_store"
      end

      def generate_session_migration
        generate "session_migration"
      end
    end
  end
end
