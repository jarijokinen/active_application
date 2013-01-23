module ActiveApplication #:nodoc:
  module Routes
    # Generates default routes for an application
    def active_application_routes
      customer_path = Configuration.module_paths[:customer]
      backend_path  = Configuration.module_paths[:backend]
      account_path  = Configuration.module_paths[:account]

      scope module: "active_application" do
        unless customer_path.nil?
          namespace :customer, path: customer_path do
            root to: "dashboard#index"
          end
        end

        unless backend_path.nil?
          namespace :backend, path: backend_path do
            root to: "dashboard#index"
          end
        end
      end

      unless account_path.nil?
        devise_for :users, 
          skip: [:registrations, :sessions, :confirmations, :passwords]

        devise_scope :user do
          # Registrations
          get  "/#{account_path}/new"    => "devise/registrations#new", 
            as: :new_user_registration
          post "/#{account_path}"        => "devise/registrations#create", 
            as: :user_registration
          get  "/#{account_path}/edit"   => "devise/registrations#edit",
            as: :edit_user_registration
          put  "/#{account_path}"        => "devise/registrations#update"
       
          # Sessions
          get  "/#{account_path}/login"  => "devise/sessions#new",
            as: :new_user_session
          post "/#{account_path}/login"  => "devise/sessions#create",
            as: :user_session
          get  "/#{account_path}/logout" => "devise/sessions#destroy",
            as: :destroy_user_session
       
          # Confirmations
          get  "/#{account_path}/confirm/:confirmation_token" => 
            "devise/confirmations#show",
            as: :user_confirmation

          # Passwords
          get  "/#{account_path}/reset"  => "devise/passwords#new",
            as: :new_user_password
          post "/#{account_path}/reset"  => "devise/passwords#create",
            as: :user_password
          get  "/#{account_path}/reset/:reset_password_token" => 
            "devise/passwords#edit",
            as: :edit_user_password
          put  "/#{account_path}/reset"  => "devise/passwords#update"
        end
      end
    end
  end
end
