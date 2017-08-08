Rails.application.routes.draw do
  resources :sessions, only: [:create]
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # resources :zombies, only: [:create, :index]
  # get '/clients/', to: 'clients#index'
  # get '/clients/:id', to: 'clients#show'
  # post '/clients/', to: 'clients#create'
  # put '/clients/', to: 'clients#update'
  # patch '/clients/', to: 'clients#update'

  resources :clients, only: [:create, :index, :show, :update, :destroy]

  root 'clients#index'
end
