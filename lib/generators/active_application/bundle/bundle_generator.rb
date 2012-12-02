module ActiveApplication
  module Generators
    class BundleGenerator < Rails::Generators::Base
      def self.source_root 
        @source_root ||= File.join(File.dirname(__FILE__), "templates")
      end

      def copy_gemfile
        template "Gemfile"
      end

      def bundle
        env_rubyopt = ENV['RUBYOPT']
        ENV['RUBYOPT'] = env_rubyopt.sub(" -rbundler/setup", "")
        run "bundle install"
        ENV['RUBYOPT'] = env_rubyopt
      end
    end
  end
end
