Rails.application.routes.draw do
  get '/aquariums', to: 'aquariums#index'
  get 'aquariums/:id', to: 'aquariums#show'
  get '/aquariums/:aquarium_id/fish', to: 'aquarium_fish#index'

  get '/fish', to: 'fish#index'
  get '/fish/:id', to: 'fish#show'

  get '/docks', to: 'docks#index'
  get '/docks/new', to: 'docks#new'
  post '/docks', to: 'docks#create'
  get '/docks/:id', to: 'docks#show'
  get '/docks/:dock_id/boats', to: 'dock_boats#index'

  get '/boats', to: 'boats#index'
  get '/boats/:id', to: 'boats#show'

end
