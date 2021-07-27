Rails.application.routes.draw do
  root 'posts#index'

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  resources :users, only: %i[index new create show]
  resources :posts, shallow: true do
    resources :comments
  end
  resources :likes, only: %i[create destroy]
  resources :relationships, only: %i[create destroy]
end
#  Rails.application.routes.draw do
#   constraints ->(request) { request.session[:user_id].present? } do
#      # ログインしてる時のルートパス
#     root 'posts#index'
#   end
#   root 'users#new'

#   resources :users, only: %i[index create]

#   resources :posts, shallow: true do
#     resources :comments
#   end
#   resources :likes, only: %i[create destroy]

#   get '/login' => 'sessions#new'
#   post '/login' => 'sessions#create'
#   delete 'logout', to: 'sessions#destroy'

#   # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

#   resources :posts
# end
