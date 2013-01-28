module ActiveApplication
  module Public
    class ResourceController < ActiveApplication::Public::BaseController
      load_and_authorize_resource
      inherit_resources
      defaults route_prefix: ""
      has_scope :page, default: 1, only: :index
    end
  end
end
