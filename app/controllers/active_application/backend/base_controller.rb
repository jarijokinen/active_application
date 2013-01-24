module ActiveApplication
  module Backend
    class BaseController < ActiveApplication::BaseController
      include ActiveApplication::ControllerMethods
      layout "active_application/backend"
      before_filter :set_backend_locale
      before_filter :require_administrator_role
    end
  end
end
