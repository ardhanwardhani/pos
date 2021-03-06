Rails.application.routes.draw do
   devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api, defaults: {format: :json} do
    namespace :v1 do
      root "api/v1/products#index"
      devise_for :users, controller: { sessions: 'api/v1/sessions' }

      resources :outlets, except: [:new, :edit]
      resources :products, except: [:new, :edit]
    end
  end

  root "cashiers#index"
  resources :dashboards, only: [:index]
  get 'dashboard', to: 'cashiers#index', as: 'dashboard'
  get 'dashboard/:user_id/outlet', to: 'cashiers#outlet', as: 'outlet_cashier'
  get 'dashboard/:user_id/outlet/:outlet_id/operator', to: 'cashiers#operator', as: 'operator_cashier'
  get 'dashboard/:user_id/outlet/:outlet_id/operator/:operator_id/pin', to: 'cashiers#pin_cashier', as: 'pin_cashier'
  post 'dashboard/:user_id/outlet/:outlet_id/operator/:operator_id/cek', to: 'cashiers#cek_pin_cashier', as: 'cek_pin_cashier'

  get 'dashboard/:user_id/outlet/:outlet_id/operator/:operator_id/pinsuperadmin', to: 'cashiers#pin_superadmin_cashier', as: 'pin_superadmin_cashier'
  post 'dashboard/:user_id/outlet/:outlet_id/operator/:operator_id/ceksuperadmin', to: 'cashiers#cek_pin_superadmin_cashier', as: 'cek_pin_superadmin_cashier'
  get 'dashboard/:id/pin', to: 'cashiers#pin_superadmin', as: 'pin_superadmin'
  post 'dashboard/:id/cekpin', to: 'cashiers#cek_pin_superadmin', as: 'cek_pin_superadmin'
  resources :outlets, :members
  resources :bussinesses, only: [:edit, :update]
  resources :products do
    resources :varians, except: [:new, :create]
  end
  get 'products/:id/sale', to: 'products#onsale', as: 'sale'
  get 'products/:id/notsold', to: 'products#notsold', as: 'not_sold'
  get 'products/:product_id/varians/:id/sale', to: 'varians#onsale', as: 'varian_sale'
  get 'products/:product_id/varians/:id/notsold', to: 'varians#notsold', as: 'varian_not_sold'
  resources :categories
  resources :instocks, only: [:index, :show, :new, :create] do
    resources :initems, only: [:new, :create, :destroy]
  end
  resources :outstocks, except: [:edit, :update, :delete] do
    resources :outitems, only: [:new, :create, :destroy]
  end
  resources :cardstocks, only: [:index]
  resources :suppliers, :employees
  resources :accounts, only: [:index]
  get 'outlet/:outlet_id/operator/:operator_id/transaction', to: 'transactions#index', as: 'transactions'
  get 'outlet/:outlet_id/operator/:operator_id/transaction/new', to: 'transactions#create', as: 'new_transaction'
  get 'outlet/:outlet_id/operator/:operator_id/transaction/:transaction_id/new', to: 'transaction_items#new', as: 'new_transaction_item'
  post 'outlet/:outlet_id/operator/:operator_id/transaction/:transaction_id/create', to: 'transaction_items#create', as: 'transaction_item'
  delete 'outlet/:outlet_id/operator/:operator_id/transaction/:transaction_id/transaction_item/:transitem_id', to: 'transaction_items#destroy', as: 'destroy_transaction_item'
  get 'outlet/:outlet_id/operator/:operator_id/transaction/:transaction_id/save', to: 'transactions#save_transaction', as: 'save_transaction'
  get 'outlet/:outlet_id/operator/:operator_id/transaction/:transaction_id/pay', to: 'transactions#pay_transaction', as: 'pay_transaction'
  get 'outlet/:outlet_id/operator/:operator_id/transaction/:transaction_id/payment', to: 'transactions#payment_transaction', as: 'payment_transaction'
  get 'outlet/:outlet_id/operator/:operator_id/transaction/:transaction_id/detail', to: 'transactions#show', as: 'transaction'
  get 'outlet/:outlet_id/operator/:operator_id/history', to: 'transactions#transaction_history', as: 'transaction_histories'
end
