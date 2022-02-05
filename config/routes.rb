Rails.application.routes.draw do
  get '/aquariums', to: 'aquariums#index'
  get 'aquariums/:id', to: 'aquariums#show'

  get '/fish', to: 'fish#index'
  
  get '/docks', to: 'docks#index'
  get '/docks/:id', to: 'docks#show'
  get '/docks/:dock_id/boats', to: 'dock_boats#index'
  
  get '/boats', to: 'boats#index'
  get '/boats/:id', to: 'boats#show'
end
