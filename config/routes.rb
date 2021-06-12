 Rails.application.routes.draw do
  constraints ->(request) { request.session[:user_id].present? } do
     # ログインしてる時のルートパス
    root 'posts#index'
  end
  root 'users#new'
  
  resources :users, only: %i[index create]
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :posts
end
