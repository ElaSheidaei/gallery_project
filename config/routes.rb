Rails.application.routes.draw do
  devise_for :users
  
  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  
  resources :users
  # get "/users", to: "users#index"
  # get "/users/:id", to: "users#show"
  # get "/users/new", to: "users#new"
  # post "/users", to: "users#create"
  # get "/users/:id/edit", to: "users#edit"
  # put "users/:id", to: "users#update"
  # delete "users/:id", to: "users#destroy"
  # Defines the root path route ("/")
  root "users#index"
  resources :galleries
  put "upload/:gallery_id", to: "upload#update"
end
