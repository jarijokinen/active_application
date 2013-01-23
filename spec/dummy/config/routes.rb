Dummy::Application.routes.draw do
  namespace :backend do
    resources :posts
  end

  namespace :customer do
    resources :posts
  end

  resources :posts do
    resources :comments
  end

  resources :categories do
    resources :posts
  end

  resources :blogs do
    resources :categories
  end

  active_application_routes
  
  root to: "posts#index"
end
