module ActiveApplication
  class BaseController < ::ApplicationController
    include ActiveApplication::ControllerMethods
    before_filter :set_default_locale
  end
end
