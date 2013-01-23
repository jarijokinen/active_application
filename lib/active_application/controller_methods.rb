module ActiveApplication
  module ControllerMethods
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
  end
end
