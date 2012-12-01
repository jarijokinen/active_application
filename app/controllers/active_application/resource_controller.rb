class ActiveApplication::ResourceController < SimpleResource::BaseController
  defaults route_prefix: ""
  before_filter :authenticate_user!
  load_and_authorize_resource

  has_scope :page, default: 1

  def render_not_found
    render "active_application/public/404", status: :not_found, layout: false
  end

  rescue_from CanCan::AccessDenied do |exception|
    return render_not_found
  end

  def create
    create! { collection_url }
  end 
        
  def update
    update! { collection_url }
  end
end
