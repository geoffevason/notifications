Rails.application.routes.draw do

  root to: 'home#index'

  devise_for :users

  resources :posts, only: [:create] do
    resources :comments, only: [:create]
  end

  resources :likes, only: [:create, :destroy]

end
