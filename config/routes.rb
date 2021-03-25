Rails.application.routes.draw do
  devise_for :users

  #get 'homes/index'
  root to: "homes#index"
  resources :users, only: [:new, :edit, :update, :show]
  resources :tweets do
    resources :comments, only: :create
  end
  resources :account, only: [:show]
end
