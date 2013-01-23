module ActiveApplication
  module Public
    class BaseController < ActiveApplication::BaseController
      before_filter :set_public_locale
      
      def not_found
        render "not_found", status: :not_found, layout: false
      end

      private

      def set_public_locale
        I18n.locale = I18n.default_locale
      end
    end
  end
end
