Rails.application.routes.draw do
  get '/aquariums', to: 'aquariums#index'
  get 'aquariums/:id', to: 'aquariums#show'
  get '/docks', to: 'docks#index'
end
