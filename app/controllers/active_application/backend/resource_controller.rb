module ActiveApplication
  module Backend
    class ResourceController < SimpleResource::BaseController
      include ActiveApplication::ControllerMethods
      layout "active_application/backend"
      before_filter :set_backend_locale
      before_filter :require_administrator_role
      defaults route_prefix: ""
      has_scope :page, default: 1
    end
  end
end
