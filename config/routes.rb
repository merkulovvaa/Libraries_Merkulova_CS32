Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "users#index"

  resources :books
  resources :authors
  resources :genres
  resources :libraries
  resources :users
  resources :reader_cards
end
