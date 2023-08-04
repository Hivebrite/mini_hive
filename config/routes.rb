Rails.application.routes.draw do
  root_controller = 'cms/pages#home'
  root root_controller
  # match '/*' => root_controller, via: :options
  namespace :onboardings do
    resources :objectives do
      resources :tour_steps, only: [:index, :show]
    end
    resources :steps
  end
  namespace :cms do
    resources :pages do
      collection do
        get :home
      end
    end
  end
  namespace :news do
    resources :posts
  end
  namespace :media_center do
    resources :files
  end
  
  get "sessions/create"
  get "sessions/destroy"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
