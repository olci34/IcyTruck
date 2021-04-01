Rails.application.routes.draw do
  
  root 'static#home'

  resources :trucks, except: [:new] do ### BLOG POST
    resources :icecreams
    resources :orders, only: [:new, :create, :index]
  end

  get 'truck_signup', to: 'trucks#new'
  get 'truck_login', to: "sessions#truck_login"
  post 'truck_login', to: 'sessions#create'

  resources :customers, except: [:new]
  get 'wallet', to: 'customers#wallet'
  patch 'wallet', to: 'customers#update_wallet'
  get 'signup', to: 'customers#new'
  get 'login', to: 'sessions#login'
  post 'login', to: 'sessions#create'
  get 'logout', to: 'sessions#destroy'

  get '/auth/facebook/callback', to: 'sessions#create_via_fb'


  resources :orders

end
