Rails.application.routes.draw do
  get 'toppages/index'
root to: 'toppages#index'

#toppagesにルートを変えるため変更
#root to: 'tasks#index'
	
	resources :tasks
end
