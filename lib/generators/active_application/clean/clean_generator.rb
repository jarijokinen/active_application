module ActiveApplication
  module Generators
    class CleanGenerator < Rails::Generators::Base
      def remove_directories
        remove_dir "doc"
        remove_dir "test"  
      end

      def remove_files
        remove_file "app/assets/images/rails.png"
        create_file "app/assets/images/.gitkeep"
        remove_file "app/views/layouts/application.html.erb"
        remove_file "public/index.html"
        remove_file "public/robots.txt"
        create_file "public/robots.txt"
        remove_file "README"
      end
    end
  end
end
