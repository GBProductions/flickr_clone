Rails.application.routes.draw do

  root to: 'sessions#new'

  get '/signup' => 'users#new'
  post '/users' => 'users#create'

  get '/users/:id', to: 'users#show', as: 'user'
  get '/users' => 'users#index'

  get '/signin' => 'sessions#new'
  post '/signin' => 'sessions#create'
  get '/signout' => 'sessions#destroy'
end
ost '/signin' => 'sessions#create'
  get '/signout' => 'sessions#destroy'
