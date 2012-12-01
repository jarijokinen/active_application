module SimpleResource
  module CustomHelper
    def resource_human_attributes
      human_attributes = resource_attributes - non_human_attributes
      
      if @exclude_fields
        human_attributes = human_attributes - @exclude_fields
      end

      if respond_to?("parent?")
        human_attributes = human_attributes - ["#{parent.class.name.underscore}_id"]
      end

      human_attributes
    end

    def new_resource_link
      link_to("<i class='icon-plus-sign'></i> #{new_resource_title}".html_safe, new_resource_path, class: "btn")
    end

    def link_to_action(action_name, title, path)
      action_name = action_name.to_sym
      if action_name == :delete
        link_to(t("simple_resource.#{action_name.to_s}", default: title), path,
          method: :delete, confirm: t("simple_resource.delete_confirmation", default: "Are you sure?"), class: "btn btn-mini btn-danger")
      else
        link_to(t("simple_resource.#{action_name.to_s}", default: title), path, class: "btn btn-mini")
      end
    end

    def default_actions_for(resource)
      html = Array.new
      html << link_to_action(:show, "<i class='icon-zoom-in'></i> Show".html_safe, resource_path(resource))
      html << link_to_action(:edit, "<i class='icon-edit'></i> Edit".html_safe, edit_resource_path(resource))
      html << link_to_action(:delete, "<i class='icon-trash icon-white'></i> Delete".html_safe, resource_path(resource))
      html.join("\n").html_safe
    end
  end
end

SimpleResource::BaseHelper.extend SimpleResource::CustomHelper
