Rails.application.routes.draw do
  # get 'search/index'

  devise_for :users

  resources :users
  resources :tweets
  resources :follows, only: [:create, :destroy]

  post 'search', to: 'search#index', as: 'search'

  get 'home/index'
  root "home#index"
end
