module ActiveApplication
  module Account
    class PasswordsController < Devise::PasswordsController
      include ActiveApplication::ControllerMethods
      before_filter :set_default_locale
      layout "active_application/account"

      private

      def resource_params
        permit_attributes = 
          %w(email password password_confirmation reset_password_token) +
          resource_params_additions
        params.require(:user).permit(*permit_attributes)
      end
    end
  end
end
