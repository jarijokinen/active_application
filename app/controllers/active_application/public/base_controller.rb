module ActiveApplication
  module Public
    class BaseController < ActiveApplication::BaseController
      def not_found
        render "not_found", status: :not_found, layout: false
      end
    end
  end
end
