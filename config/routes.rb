Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root to: 'static#home'

  get '/about', to: 'static#about'
  get '/login', to: 'sessions#new'
  match '/auth/:provider/callback', to: 'sessions#create', via: [:get, :post]
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'

  get '/recipes/vegetarian', to: 'recipes#vegetarian'
  get '/recipes/vegan', to: 'recipes#vegan'

  resources :users, only: [:show] do
    resources :recipes, only: [:show]
  end
  resources :users, only: [:index, :show, :new, :create]
  resources :recipes, only: [:index, :show]

end
