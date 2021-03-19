Rails.application.routes.draw do

  resources :genres
  root "movies#index"

  get "movies/filter/:filter", to: "movies#index", as: :filtered_movies

  resources :movies do
    resources :reviews
    resources :favorites, only: [:create, :destroy]
  end

  resource :session, only: [:new, :create, :destroy]
  get "signin", to: "sessions#new"
  get "signup", to: "users#new"

  resources :users
end
