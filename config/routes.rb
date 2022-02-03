Rails.application.routes.draw do
  get '/aquariums', to: 'aquariums#index'
  get '/docks', to: 'docks#index'
end
