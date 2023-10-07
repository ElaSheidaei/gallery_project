Rails.application.routes.draw do
  devise_for :users, controllers: { sessions: "users/sessions", registrations: "users/registrations"}
  get 'main', to: "main#index"
  
  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  

  # get "/users", to: "users#index"
  # get "/users/:id", to: "users#show"
  # get "/users/new", to: "users#new"
  # post "/users", to: "users#create"
  # get "/users/:id/edit", to: "users#edit"
  # put "users/:id", to: "users#update"
  # delete "users/:id", to: "users#destroy"
  # Defines the root path route ("/")
  root "main#index"
  resources :galleries
  resources :users, only: [:index, :show]
  put "upload/:gallery_id", to: "upload#update"
end
