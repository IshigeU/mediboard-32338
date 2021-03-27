Rails.application.routes.draw do
  devise_for :users

  #get 'users#show'
  root to: "homes#index"
  resources :users, only: [:new, :edit, :update, :show]
  resources :tweets do
    resources :comments, only: :create
  end
  resources :profiles, only: [:show]
end
