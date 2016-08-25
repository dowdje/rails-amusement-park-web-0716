Rails.application.routes.draw do
  resources :users
  resources :attractions

  get '/login', to: 'sessions#new', as: 'login'
  post '/login', to: 'sessions#create'
  post '/logout', to: 'sessions#destroy'
  get '/', to: 'sessions#home'
  post '/new_ride', to: 'attractions#new_ride', as: 'new_ride'




end