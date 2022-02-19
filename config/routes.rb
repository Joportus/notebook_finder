Rails.application.routes.draw do
  resources :computers
  resources :searches
  # get 'home/index'
  get 'home/about'
  get 'home/help'
  root 'computers#index'

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
