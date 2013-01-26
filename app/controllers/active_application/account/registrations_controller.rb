module ActiveApplication
  module Account
    class RegistrationsController < Devise::RegistrationsController
      layout "active_application/account"

      private

      def resource_params
        params.require(:user).permit(:email, :password, :password_confirmation, :current_password)
      end
    end
  end
end
