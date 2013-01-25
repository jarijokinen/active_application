module ActiveApplication
  module Account
    class PasswordsController < Devise::PasswordsController
      private

      def resource_params
        params.require(:user).permit(:email, :password, :password_confirmation, :reset_password_token)
      end
    end
  end
end
