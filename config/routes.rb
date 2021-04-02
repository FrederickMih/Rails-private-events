Rails.application.routes.draw do
  resources :users, only: [:create, :new, :show, :index] 
  resources :events do
    member do
      get 'deletee'
      get 'remsession'
      get 'visitor'
      get 'cancel_visitor'
    end
  end


  get '/sign_up', to: 'users#new'
  root "users#index"

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  get '/logout', to: 'users#new'
  
end
