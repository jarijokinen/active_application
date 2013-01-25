module ActiveApplication
  class BaseController < ::ApplicationController
    include ActiveApplication::ControllerMethods
    before_filter :set_default_locale
     
    private

    rescue_from ActiveRecord::RecordNotFound do |exception|
      return render_not_found
    end
  end
end
