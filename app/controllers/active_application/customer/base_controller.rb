module ActiveApplication
  module Customer
    class BaseController < ActiveApplication::BaseController
      include ActiveApplication::ControllerMethods
      layout "active_application/customer"
      before_filter :require_customer_role
    end
  end
end
