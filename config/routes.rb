Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root to: 'lists#index'

  resources :lists, only: [:index, :show, :new, :create] do
    resources :movies
  end

  resources :bookmarks
end
