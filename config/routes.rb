Rails.application.routes.draw do
  root to: 'clients#index'
  resources :clients
end
