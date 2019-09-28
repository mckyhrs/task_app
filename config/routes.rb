Rails.application.routes.draw do
  get '/', to: 'tasks#index'
  get '/:id', to: 'tasks#show'
end
