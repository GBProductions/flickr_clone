Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: 'registrations'}

  root to: "home#index"

  resources :users do
    resources :photos 
  end

  resources :photos do
    resources :comments
    resources :tags
  end

  resources :tags
end

