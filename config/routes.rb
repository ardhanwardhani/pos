Rails.application.routes.draw do
  devise_for :users, :controllers => {:sessions => "sessions", :registrations => "registrations"}
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root "outlets#index"

  resources :homes, only: [:index]
  resources :outlets
  resources :bussinesses, only: [:edit, :update]
  resources :members
  resources :products
  get 'products/:id/sale', to: 'products#onsale', as: 'sale'
  get 'products/:id/notsold', to: 'products#notsold', as: 'not_sold'
  resources :categories
  resources :instocks do
    resources :initems, only: [:new, :create, :destroy]
  end
  resources :outstocks
  resources :suppliers
  resources :accounts, only: [:index]
end
