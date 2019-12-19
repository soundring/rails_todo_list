Rails.application.routes.draw do
  root to: 'todos#index'

  resources :users
  resources :todos
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'
end
