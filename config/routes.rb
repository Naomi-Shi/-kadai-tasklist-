Rails.application.routes.draw do
  get 'sessions/new'
  get 'sessions/create'
  get 'sessions/destroy'
#  get 'users/index'
#  get 'users/show'
#  get 'users/new'
#  get 'users/create'
#  root to: 'toppages#index'

  root to: 'tasks#index'
#toppageは後でtasks#indexに戻す。ログインか否かでページが変わるように設定

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  get 'signup', to: 'users#new'
  resources :users, only: [:index, :show, :new, :create]
	
	resources :tasks
#tasksのindexとusersのindexの関係
end