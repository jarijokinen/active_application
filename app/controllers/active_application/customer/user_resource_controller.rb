module ActiveApplication
  module Customer
    class UserResourceController < SimpleResource::UserResourceController
      include ActiveApplication::ControllerMethods
      layout "active_application/customer"
      before_filter :require_customer_role
    end
  end
end
