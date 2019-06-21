Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'companies#index'

  get '/users/login', to: 'users#new'
  get '/login', to: 'users#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'

  resources :sessions
  resources :users
  resources :ceos

  resources :companies do
    resources :problems
    resources :technology_breakthroughs
  end

  get '/auth/github/callback', to: 'sessions#create'

end
