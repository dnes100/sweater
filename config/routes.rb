Rails.application.routes.draw do

  # get 'search/index'

  devise_for :users

  resources :users
  resources :tweets do
    member do
      post :like
      post :unlike
    end
  end
  resources :follows, only: [:create, :destroy]
  resources :retweets, only: [:create, :destroy]
  resources :messages do
    collection do
      post :search
      post :show_conversation
    end
  end

  post 'search', to: 'search#index', as: 'search'

  get 'home/index'
  root "home#index"
end
