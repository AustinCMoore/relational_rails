Rails.application.routes.draw do
  get '/aquariums', to: 'aquariums#index'
  get '/aquariums/:id/edit', to: 'aquariums#edit'
  get '/aquariums/new', to: 'aquariums#new'
  post '/aquariums', to: 'aquariums#create'
  get 'aquariums/:id', to: 'aquariums#show'
  patch '/aquariums/:id', to: 'aquariums#update'
  delete '/aquariums/:id', to: 'aquariums#destroy'

  get '/aquariums/:aquarium_id/fish', to: 'aquarium_fish#index'
  get '/aquariums/:aquarium_id/fish/new', to: 'aquarium_fish#new'
  post '/aquariums/:aquarium_id/fish', to: 'aquarium_fish#create'

  get '/fish', to: 'fish#index'
  get '/fish/:id', to: 'fish#show'
  get '/fish/:id/edit', to: 'fish#edit'
  patch '/fish/:id', to: 'fish#update'
  delete '/fish/:id', to: 'fish#destroy'

  get '/docks', to: 'docks#index'
  get '/docks/:id/edit', to: 'docks#edit'
  get '/docks/new', to: 'docks#new'
  post '/docks', to: 'docks#create'
  get '/docks/:id', to: 'docks#show'
  patch '/docks/:id', to: 'docks#update'
  delete '/docks/:id', to: 'docks#destroy'

  get '/docks/:dock_id/boats', to: 'dock_boats#index'
  get '/docks/:dock_id/boats/new', to: 'dock_boats#new'
  post '/docks/:dock_id/boats', to: 'dock_boats#create'

  get '/boats', to: 'boats#index'
  get '/boats/:id', to: 'boats#show'
  get '/boats/:id/edit', to: 'boats#edit'
  patch '/boats/:id', to: 'boats#update'
  delete '/boats/:id', to: 'boats#destroy'

end
