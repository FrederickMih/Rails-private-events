Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  # resources :user_events
  resources :events
  resources :users, only: [:create, :new, :show, :index]
  get '/sign_up', to: 'users#new'
  root "users#index"

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  delete '/events/:id', to: 'events#destroy'
  get '/logout', to: 'users#new'
  
end
