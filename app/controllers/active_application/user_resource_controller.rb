class ActiveApplication::UserResourceController < SimpleResource::UserResourceController
  defaults route_prefix: ""
  before_filter :exclude_fields

  def exclude_fields
    @exclude_fields = %w(user_id)
  end
end
