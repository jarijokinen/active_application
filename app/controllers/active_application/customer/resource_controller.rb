module ActiveApplication
  module Customer
    class ResourceController < SimpleResource::BaseController
      include ActiveApplication::ControllerMethods
      layout "active_application/customer"
      before_filter :set_customer_locale
      before_filter :require_customer_role
      defaults route_prefix: ""
      has_scope :page, default: 1
      
      private

      def resource_params
        permit_attributes = resource_class.attribute_names - %w(id created_at updated_at)
        params.require(controller_name.tableize.singularize.to_sym).permit(*permit_attributes)
      end
      
      rescue_from ActiveRecord::RecordNotFound do |exception|
        return render_not_found
      end
    end
  end
end
