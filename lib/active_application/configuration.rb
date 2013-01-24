module ActiveApplication #:nodoc:
  module Configuration
    # Paths to modules
    #
    # Default values
    #
    #   module_paths = {
    #     account:  "account",
    #     backend:  "backend",
    #     customer: "customer"
    #   }
    #
    # Set path to nil to disable routes for a module. For example, disable 
    # all authentication routes by setting an account module path to nil:
    #
    #   module_paths[:account] = nil
    mattr_accessor :module_paths
    self.module_paths = {
      account:  "account",
      backend:  "backend",
      customer: "customer"
    }

    # Locales for modules
    #
    # Default values
    #
    #   module_locales = {
    #     default:  :en,
    #     backend:  :en,
    #     customer: :en
    #   }
    mattr_accessor :module_locales
    self.module_locales = {
      default:  :en,
      backend:  :en,
      customer: :en
    }
  end
end
