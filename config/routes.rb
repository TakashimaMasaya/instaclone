Rails.application.routes.draw do
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  resources :users, only: %i[index new create show]
  resources :posts, shallow: true do
    collection do
      get :search
    end
    resources :comments
  end
  resources :likes, only: %i[create destroy]
  resources :relationships, only: %i[create destroy]

  namespace :mypage do
    resource :account, only: %i[edit update]
  end


  constraints ->(request) { request.session[:user_id].present? } do
    # ログインしてる時のルートパス
    root 'posts#index'
  end
  # ログインしてない時のルートパス
  root 'sessions#new'
end