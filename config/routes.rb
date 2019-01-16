Rails.application.routes.draw do
  devise_for :users, :controllers => {:sessions => "sessions", :registrations => "registrations"}
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "cashiers#index"
  get 'dashboard', to: 'cashiers#index', as: 'dashboard'
  get 'dashboard/:user_id/outlet', to: 'cashiers#outlet', as: 'outlet_cashier'
  get 'dashboard/:user_id/outlet/:outlet_id/operator', to: 'cashiers#operator', as: 'operator_cashier'
  get 'dashboard/:user_id/outlet/:outlet_id/operator/:operator_id/pin', to: 'cashiers#pin_cashier', as: 'pin_cashier'
  post 'dashboard/:user_id/outlet/:outlet_id/operator/:operator_id/cek', to: 'cashiers#cek_pin_cashier', as: 'cek_pin_cashier'

  get 'dashboard/:user_id/outlet/:outlet_id/operator/:operator_id/pinsuperadmin', to: 'cashiers#pin_superadmin_cashier', as: 'pin_superadmin_cashier'
  post 'dashboard/:user_id/outlet/:outlet_id/operator/:operator_id/ceksuperadmin', to: 'cashiers#cek_pin_superadmin_cashier', as: 'cek_pin_superadmin_cashier'
  get 'dashboard/:id/pin', to: 'cashiers#pin_superadmin', as: 'pin_superadmin'
  post 'dashboard/:id/cekpin', to: 'cashiers#cek_pin_superadmin', as: 'cek_pin_superadmin'
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
  resources :employees
  resources :accounts, only: [:index]
  # routes transaction for cashier from employee
  get 'outlet/:outlet_id/operator/:operator_id/transaction', to: 'transactions#index', as: 'transactions'
  get 'outlet/:outlet_id/operator/:operator_id/transaction/new', to: 'transactions#create', as: 'new_transaction'
  get 'outlet/:outlet_id/operator/:operator_id/transaction/:transaction_id/new', to: 'transaction_items#new', as: 'new_transaction_item'
  post 'outlet/:outlet_id/operator/:operator_id/transaction/:transaction_id/create', to: 'transaction_items#create', as: 'transaction_item'
  delete 'outlet/:outlet_id/operator/:operator_id/transaction/:transaction_id/transaction_item/:transitem_id', to: 'transaction_items#destroy', as: 'destroy_transaction_item'
  get 'outlet/:outlet_id/operator/:operator_id/transaction/:transaction_id/save', to: 'transactions#save_transaction', as: 'save_transaction'

  # routes transaction for cashier from user/superadmin
  get 'outlet/:outlet_id/admin/:operator_id/transaction', to: 'transactions#index_admin', as: 'admin_transactions'
  get 'outlet/:outlet_id/admin/:operator_id/transaction/new', to: 'transactions#create_admin', as: 'admin_new_transaction'
  get 'outlet/:outlet_id/admin/:operator_id/transaction/:transaction_id/new', to: 'transaction_items#new_admin', as: 'admin_new_transaction_item'
  post 'outlet/:outlet_id/admin/:operator_id/transaction/:transaction_id/create', to: 'transaction_items#create_admin', as: 'admin_transaction_item'
  delete 'outlet/:outlet_id/admin/:operator_id/transaction/:transaction_id/transaction_item/:transitem_id', to: 'transaction_items#destroy_admin', as: 'admin_destroy_transaction_item'
  get 'outlet/:outlet_id/admin/:operator_id/transaction/:transaction_id/save', to: 'transactions#save_transaction_admin', as: 'admin_save_transaction'
end
