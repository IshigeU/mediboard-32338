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
  # フォローする
  post 'follow/:id' => 'relationships#follow', as: 'follow'
  # フォロー外す
  post 'unfollow/:id' => 'relationships#unfollow', as: 'unfollow'

end
