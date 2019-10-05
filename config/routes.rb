Rails.application.routes.draw do
	resources :tasks
	root 'tasks#index'
	get 'login' => 'sessions#new'
	post 'login' => 'sessions#create'
	delete 'logout' => 'sessions#destroy'
end
