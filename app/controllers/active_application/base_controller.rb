module ActiveApplication
  class BaseController < ::ApplicationController
    include ActiveApplication::ControllerMethods
  end
end
