Rails.application.routes.draw do
  devise_for :users
  resources :reviews
  resources :reservations
  resources :fields
  resources :ubications
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
