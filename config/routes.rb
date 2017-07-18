Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # resources :zombies, only: [:create, :index]
  get '/clients/', to: 'clients#index'
  post '/clients/', to: 'clients#create'
  put '/clients/', to: 'clients#update'
  patch '/clients/', to: 'clients#update'

  root 'clients#index'
end
