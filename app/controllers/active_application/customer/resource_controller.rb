module ActiveApplication
  module Customer
    class ResourceController < SimpleResource::BaseController
      include ActiveApplication::ControllerMethods
      layout "active_application/customer"
      before_filter :set_customer_locale
      before_filter :require_customer_role
      defaults route_prefix: ""
      has_scope :page, default: 1
    end
  end
end
