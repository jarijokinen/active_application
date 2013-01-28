module ActiveApplication
  module Account
    class SessionsController < Devise::SessionsController
      include ActiveApplication::ControllerMethods
      before_filter :set_default_locale
      layout layout_for_account
    end
  end
end
