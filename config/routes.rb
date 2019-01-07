Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root "outlets#index"

  resources :homes, only: [:index]
  resources :outlets
  resources :bussinesses, only: [:edit, :update]
  resources :members
  resources :products
  resources :categories
  resources :accounts, only: [:index]
end
