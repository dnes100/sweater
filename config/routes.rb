Rails.application.routes.draw do
  resources :tweets
  resources :users
  get 'home/index'
  root "home#index"
end
