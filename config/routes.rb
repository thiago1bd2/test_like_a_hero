Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  root 'weapons#index'

  resources :users, only: %i[index create]
  resources :weapons
  resources :enemies, only: %i[update destroy]
end
