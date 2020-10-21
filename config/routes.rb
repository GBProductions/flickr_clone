Rails.application.routes.draw do

  root to: "home#index"

  devise_for :users, :controllers => { registrations: "registrations"}


  resources :users do
    resources :photos 
  end

  resources :photos do
    resources :comments
    resources :tags
  end

  resources :tags
end

