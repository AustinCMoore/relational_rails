Rails.application.routes.draw do
  get '/aquariums', to: 'aquariums#index'
  get 'aquariums/:id', to: 'aquariums#show'
  get '/docks', to: 'docks#index'
  get '/docks/:id', to: 'docks#show'
end
