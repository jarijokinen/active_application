module ActiveApplication
  module Account
    class ConfirmationsController < Devise::ConfirmationsController
      include ActiveApplication::ControllerMethods
      before_filter :set_default_locale
      layout layout_for_account

      def show
        self.resource = resource_class.confirm_by_token(params[:confirmation_token])

        if resource.errors.empty?
          set_flash_message(:notice, :confirmed_without_sign_in) if is_navigational_format?
          respond_with_navigational(resource){ redirect_to after_confirmation_path_for(resource_name, resource) }
        else
          respond_with_navigational(resource.errors, :status => :unprocessable_entity){ render :new }
        end
      end
      
      protected

      def after_confirmation_path_for(resource_name, resource)
        if current_user
          root_path
        else
          new_session_path(resource_name)
        end
      end
    end
  end
end
