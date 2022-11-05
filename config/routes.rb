Rails.application.routes.draw do
  resources :boards
  resources :labels
  resources :publications
    devise_for :users do
      resources  :publications
    end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "publications#index"
end
