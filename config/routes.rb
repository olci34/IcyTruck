Rails.application.routes.draw do
  resources :trucks
  resources :customers
  get 'logout', to: 'sessions#destroy'
end
