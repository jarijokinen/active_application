module ActiveApplication
  module Generators
    class RspecGenerator < Rails::Generators::Base
      def self.source_root 
        @source_root ||= File.join(File.dirname(__FILE__), "templates")
      end

      def install_rspec
        generate "rspec:install"
      end

      def create_directories
        empty_directory "spec/factories"
        empty_directory "spec/features"
        empty_directory "spec/helpers"
        empty_directory "spec/models"
        empty_directory "spec/support"
      end

      def install_spork
        run "spork --bootstrap"
      end

      def configure_spork
        sentinel = "config.cache_classes = true"
        data = "config.cache_classes = !(ENV['DRB'] == 'true')"
        gsub_file "config/environments/test.rb", sentinel, data
      end

      def setup_spec_helper
        remove_file "spec/spec_helper.rb"
        template "spec_helper.rb", "spec/spec_helper.rb"
      end

      def setup_guard
        template "Guardfile"
      end
    end
  end
end
