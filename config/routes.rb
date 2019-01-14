Rails.application.routes.draw do
  devise_for :users, :controllers => {:sessions => "sessions", :registrations => "registrations"}
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "cashiers#index"
  resources :cashiers, only: [:index]
  get 'cashiers/:user_id/outlet', to: 'cashiers#outlet', as: 'outlet_cashier'
  get 'cashiers/:user_id/outlet/:outlet_id/operator', to: 'cashiers#operator', as: 'operator_cashier'
  get 'cashiers/:user_id/outlet/:outlet_id/operator/:operator_id/pin', to: 'cashiers#pin', as: 'pin_cashier'
  resources :outlets
  resources :bussinesses, only: [:edit, :update]
  resources :members
  resources :products do
    resources :varians, only: [:index, :show, :edit, :update]
  end
  get 'products/:id/sale', to: 'products#onsale', as: 'sale'
  get 'products/:id/notsold', to: 'products#notsold', as: 'not_sold'
  get 'products/:product_id/varians/:id/sale', to: 'varians#onsale', as: 'varian_sale'
  get 'products/:product_id/varians/:id/notsold', to: 'varians#notsold', as: 'varian_not_sold'
  resources :categories
  resources :instocks, only: [:index, :show, :new, :create] do
    resources :initems, only: [:new, :create, :destroy]
  end
  resources :outstocks, only: [:index, :show, :new, :create] do
    resources :outitems, only: [:new, :create, :destroy]
  end
  resources :suppliers
  resources :accounts, only: [:index]
end
