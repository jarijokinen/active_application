module ActiveApplication
  module Account
    class RegistrationsController < Devise::RegistrationsController
      private

      def resource_params
        params.require(:user).permit(:email, :password, :password_confirmation, :current_password)
      end
    end
  end
end
