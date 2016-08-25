Rails.application.routes.draw do
  resources :users
  resources :attractions

  get '/login', to: 'sessions#new', as: 'login'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'



end