Rails.application.routes.draw do
  devise_for :users
  resources :reservations

  resources :fields do
    resources :reservations
    resources :reviews
  end

  resources :ubications

  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  post "login", to: "sessions#create"
  post "logout", to: "sessions#destroy"
end
