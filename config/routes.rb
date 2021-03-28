Rails.application.routes.draw do
  get 'messages/new'
  devise_for :users

  #get 'homes/index'
  root to: "homes#index"
  resources :users, only: [:new, :edit, :update, :show]
  resources :tweets do
    resources :messages, only: [:create, :destroy]
  end
  #resources :profiles, only: [:show]

end
