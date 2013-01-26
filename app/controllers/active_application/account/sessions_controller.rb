module ActiveApplication
  module Account
    class SessionsController < Devise::SessionsController
      layout "active_application/account"
    end
  end
end
