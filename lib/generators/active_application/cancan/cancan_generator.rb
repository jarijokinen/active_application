module ActiveApplication
  module Generators
    class CancanGenerator < Rails::Generators::Base
      argument :cancan_model, type: :string, default: "User"

      def self.source_root
        @source_root ||= File.join(File.dirname(__FILE__), "templates")
      end

      def setup_cancan
        template "ability.rb", "app/models/ability.rb"
      end
    end
  end
end
