Rails.application.routes.draw do
  resources :trucks
  resources :customers
  get 'logout', to: 'sessions#destroy'
  get 'truck_login', to: "sessions#truck_login"
  post 'login', to: 'sessions#create' 
end
