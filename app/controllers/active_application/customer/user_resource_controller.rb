module ActiveApplication
  module Customer
    class UserResourceController < SimpleResource::UserResourceController
      include ActiveApplication::ControllerMethods
      layout :layout_for_customer
      before_filter :set_customer_locale
      before_filter :require_customer_role
      before_filter :exclude_user_id_field
      defaults route_prefix: ""
      has_scope :page, default: 1, only: :index
      
      private

      def exclude_user_id_field
        @exclude_fields = %w(user_id)
      end
      
      def resource_params
        permit_attributes = 
          resource_class.attribute_names - 
          %w(id created_at updated_at user_id) +
          resource_params_additions
        params.require(controller_name.tableize.singularize.to_sym).permit(*permit_attributes)
      end

      rescue_from ActiveRecord::RecordNotFound do |exception|
        return render_not_found
      end
    end
  end
end
