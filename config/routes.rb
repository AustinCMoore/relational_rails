Rails.application.routes.draw do
  get '/aquariums', to: 'aquariums#index'
  get 'aquariums/:id', to: 'aquariums#show'
  get '/docks', to: 'docks#index'
  get '/docks/:id', to: 'docks#show'
  get '/boats', to: 'boats#index'
  get '/boats/:id', to: 'boats#show'
  get '/docks/:dock_id/boats', to: 'dock_boats#index'
  get '/aquariums/:aquarium_id/fish', to: 'aquarium_fish#index'
end
