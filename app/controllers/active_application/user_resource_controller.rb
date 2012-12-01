class ActiveApplication::UserResourceController < ActiveApplication::ResourceController
  defaults route_prefix: ""
  before_filter :exclude_fields

  def exclude_fields
    @exclude_fields = %w(user_id)
  end

  protected
  
  def begin_of_association_chain
    current_user
  end
end
