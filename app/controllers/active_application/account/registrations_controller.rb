module ActiveApplication
  module Account
    class RegistrationsController < Devise::RegistrationsController
      include ActiveApplication::ControllerMethods
      layout "active_application/account"

      private

      def resource_params
        permit_attributes = 
          %w(email password password_confirmation current_password) +
          resource_params_additions
        params.require(:user).permit(*permit_attributes)
      end
    end
  end
end
