Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  # resources :user_events
  resources :users, only: [:create, :new, :show, :index] 
  resources :events do
    member do
      get 'deletee'
      get 'remsession'
    end
  end


  get '/sign_up', to: 'users#new'
  root "users#index"

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  get '/logout', to: 'users#new'
  
end
