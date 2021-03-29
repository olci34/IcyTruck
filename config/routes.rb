Rails.application.routes.draw do
  root 'static#home'
  resources :trucks, except: [:new, :create] do ### BLOG POST
    resources :icecreams, only: [:show]
  end
  get 'truck_signup', to: 'trucks#new'
  post 'truck_signup', to: 'trucks#create'

  resources :icecreams

  resources :customers
  get 'logout', to: 'sessions#destroy'
  get '/auth/facebook/callback', to: 'sessions#create_via_fb'
  get 'truck_login', to: "sessions#truck_login"
  post 'truck_login', to: 'sessions#create'
end
