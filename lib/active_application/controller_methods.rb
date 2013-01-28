module ActiveApplication
  module ControllerMethods
    private

    def render_not_found
      render "active_application/public/base/not_found", status: :not_found, layout: false
    end

    def require_customer_role
      require_role :customer
    end

    def require_administrator_role
      require_role :administrator
    end

    def require_role(role)
      unless current_user && current_user.has_role?(role)
        return render_not_found
      end
    end

    def set_default_locale
      set_locale Configuration.module_locales[:default]
    end
    
    def set_customer_locale
      set_locale Configuration.module_locales[:customer]
    end

    def set_backend_locale
      set_locale Configuration.module_locales[:backend]
    end

    def set_locale(locale)
      I18n.locale = locale
    end
      
    def resource_params_additions
      []
    end
    
    def layout_for_account
      set_locale Configuration.module_layouts[:account]
    end

    def layout_for_customer
      set_locale Configuration.module_layouts[:customer]
    end
    
    def layout_for_backend
      set_locale Configuration.module_layouts[:backend]
    end
  end
end
