Rails.application.routes.draw do
  root to: 'home#index'

  devise_for :users

  resources :posts, only: [:create, :show] do
    resources :comments, only: [:create, :destroy], shallow: true
    resources :likes, only: [:create]
  end

  resources :comments, only: [] do
    resources :likes, only: [:create]
  end

  resources :likes, only: [:destroy]

  resources :notification_preferences, only: [:index] do
    put :update_all, on: :collection
  end
end
