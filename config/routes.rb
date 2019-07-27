Rails.application.routes.draw do
#  get 'users/index'
#  get 'users/show'
#  get 'users/new'
#  get 'users/create'
  root to: 'toppages#index'

#root to: tasks#index
#toppageは後でtasks#indexに戻す

  get 'signup', to: 'users#new'
  resources :users, only: [:index, :show, :new, :create]
	
	resources :tasks
end
