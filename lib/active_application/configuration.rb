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

    # Controller namespaces for modules
    #
    # Default values
    #
    #   module_namespaces = {
    #     account:  "active_application/account",
    #     backend:  "active_application/backend",
    #     customer: "active_application/customer"
    #   }
    mattr_accessor :module_namespaces
    self.module_namespaces = {
      account:  "active_application/account",
      backend:  "not_implemented_yet",        # TODO: Not implemented yet
      customer: "not_implemented_yet"         # TODO: Not implemented yet
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
    
    # Layouts for modules
    #
    # Default values
    #
    #   module_layouts = {
    #     account:  "active_application/account",
    #     backend:  "active_application/backend",
    #     customer: "active_application/customer"
    #   }
    mattr_accessor :module_layouts
    self.module_layouts = {
      account:  "active_application/account",
      backend:  "active_application/backend",
      customer: "active_application/customer"
    }
  end
end
