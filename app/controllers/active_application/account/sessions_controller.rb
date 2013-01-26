module ActiveApplication
  module Account
    class SessionsController < Devise::SessionsController
      include ActiveApplication::ControllerMethods
      before_filter :set_default_locale
      layout "active_application/account"
    end
  end
end
