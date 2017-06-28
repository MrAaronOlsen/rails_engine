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
        resources :most_revenue, only: [:index], controller: 'most_revenue'
        resources :most_items, only: [:index], controller: 'most_items'
        resources :revenue, only: [:index], controller: 'revenue'
      end

      namespace :items do
        resources :find, only: [:index], controller: 'find_item'
        resources :find_all, only: [:index], controller: 'find_all_items'
      end

      namespace :invoices do
        resources :find, only: [:index], controller: 'find_invoice'
        resources :find_all, only: [:index], controller: 'find_all_invoices'
      end

      namespace :invoice_items do
        resources :find, only: [:index], controller: 'find_invoice_item'
        resources :find_all, only: [:index], controller: 'find_all_invoice_items'
      end

      namespace :transactions do
        resources :find, only: [:index], controller: 'find_transaction'
        resources :find_all, only: [:index], controller: 'find_all_transactions'
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
