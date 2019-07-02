Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'companies#index'

  post   '/login',   to: 'sessions#create'
  post '/logout',  to: 'sessions#destroy'

  resources :sessions
  resources :users
  resources :ceos

  resources :companies do
    resources :problems
    resources :technology_breakthroughs
  end

  get '/problems', to: 'problems#index'
  get '/technology_breakthroughs', to: 'technology_breakthroughs#index'
  
  get '/auth/github/callback', to: 'sessions#create'

end
