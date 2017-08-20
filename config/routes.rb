Rails.application.routes.draw do
  root to: 'clients#index'
  resources :clients do
    member do

    end
    collection do
      get 'csv_output', to: 'clients#csv_output'
    end
  end
end
