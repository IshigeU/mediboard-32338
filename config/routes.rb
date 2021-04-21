Rails.application.routes.draw do
  get 'messages/new'
  devise_for :users

  root to: "homes#index"
  resources :users, only: [:new, :create, :edit, :update, :show]
  # 投稿機能
  resources :tweets do
    resources :messages, only: [:create, :destroy]
    collection do
      get 'search'
    end
  end
  resources :drug_histories
  get 'drug_history/index'
  
  # フォローする
  post 'follow/:id' => 'relationships#follow', as: 'follow'
  # フォロー外す
  post 'unfollow/:id' => 'relationships#unfollow', as: 'unfollow'
  # いいね機能
  post 'like/:id' => 'likes#create', as: 'create_like'
  # いいね削除
  delete 'like/:id' => 'likes#destroy', as: 'destroy_like'

end
