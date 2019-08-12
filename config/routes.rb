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
  resources :users, only: [:show, :new, :create]
#8/10 users index,showを削除	
	# resources :tasks, only: [:show, :new, :create, :edit, :update, :destroy]
	resources :tasks, except: [:index]
end