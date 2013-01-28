module ActiveApplication
  module Backend
    class ResourceController < SimpleResource::BaseController
      include ActiveApplication::ControllerMethods
      layout layout_for_backend
      before_filter :set_backend_locale
      before_filter :require_administrator_role
      defaults route_prefix: ""
      has_scope :page, default: 1
    
      private
      
      def resource_params
        params.require(controller_name.tableize.singularize.to_sym).permit!
      end
      
      rescue_from ActiveRecord::RecordNotFound do |exception|
        return render_not_found
      end
    end
  end
end
