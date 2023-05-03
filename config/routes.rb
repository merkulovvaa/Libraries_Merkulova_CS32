Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "library_info#index"

  resources :books
  resources :authors
  resources :genres
  resources :libraries
  resources :users
  resources :reader_cards
  resources :library_info
  resources :users_info
  get '/download/:id' =>'downloader#download', as: 'download'
  get '/downloadAll' =>'downloader#downloadAll'
  get '/downloadUsers' =>'downloader#downloadUsers'
  get '/downloadCsv' =>'downloader#downloadCsv'
end
