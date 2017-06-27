Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do

      namespace :customers do
        resources :find, only: [:index], controller: 'find_customer'
        resources :find_all, only: [:index], controller: 'find_all_customers'
      end

      namespace :merchants do
        resources :find, only: [:index], controller: 'find_merchant'
        resources :find_all, only: [:index], controller: 'find_all_merchants'
      end

      namespace :items do
        resources :find, only: [:index], controller: 'find_item'
        resources :find_all, only: [:index], controller: 'find_all_items'
      end

      resources :customers, only: [:show, :index]
      resources :merchants, only: [:show, :index]
      resources :items, only: [:show, :index]
      resources :invoices, only: [:show, :index]
      resources :invoice_items, only: [:show, :index]
      resources :transactions, only: [:show, :index]
    end
  end
end
