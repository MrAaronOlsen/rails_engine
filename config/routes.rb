Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do

      namespace :customers do
        resources :find, only: [:index], controller: 'find_customer'
        resources :find_all, only: [:index], controller: 'find_all_customers'
        resources :random, only: [:index]
      end

      resources :customers, only: :none do
        resources :invoices, only: [:index], controller: 'customers/cust_invoices'
        resources :transactions, only: [:index], controller: 'customers/cust_transactions'
        resources :favorite_merchant, only: [:index], controller: 'customers/fav_merchant'
      end

      namespace :merchants do
        resources :find, only: [:index], controller: 'find_merchant'
        resources :find_all, only: [:index], controller: 'find_all_merchants'
        resources :random, only: [:index]
        resources :most_revenue, only: [:index], controller: 'most_revenue'
        resources :most_items, only: [:index], controller: 'most_items'
        resources :revenue, only: [:index], controller: 'top_revenue'
      end

      resources :merchants, only: :none do
        resources :revenue, only: [:index], controller: 'merchants/merchant_revenue'
        resources :favorite_customer, only: [:index], controller: 'merchants/merchant_fav_customer'
        resources :customers_with_pending_invoices, only: [:index], controller: 'merchants/pending_invoices'
        resources :items, only: [:index], controller: 'merchants/items'
        resources :invoices, only: [:index], controller: 'merchants/invoices'
      end

      namespace :items do
        resources :find, only: [:index], controller: 'find_item'
        resources :find_all, only: [:index], controller: 'find_all_items'
        resources :random, only: [:index]
        resources :most_revenue, only: [:index], controller: 'most_revenue'
        resources :most_items, only: [:index], controller: 'most_items'
      end

      resources :items, only: :none do
        resources :best_day, only: [:index], controller: 'items/best_day'
        resources :invoice_items, only: [:index], controller: 'items/invoice_items'
        resources :merchant, only: [:index], controller: 'items/merchant'
      end

      namespace :invoices do
        resources :find, only: [:index], controller: 'find_invoice'
        resources :find_all, only: [:index], controller: 'find_all_invoices'
        resources :random, only: [:index]
        resources :find, only: [:index], controller: 'find_invoice_item'
        resources :find_all, only: [:index], controller: 'find_all_invoice_items'
      end

      resources :invoices, only: :none do
        resources :transactions, only: [:index], controller: 'invoices/transactions'
        resources :invoice_items, only: [:index], controller: 'invoices/invoice_items'
        resources :items, only: [:index], controller: 'invoices/items'
        resources :customer, only: [:index], controller: 'invoices/customer'
        resources :merchant, only: [:index], controller: 'invoices/merchant'
      end

      namespace :invoice_items do
        resources :find, only: [:index], controller: 'find_invoice_item'
        resources :find_all, only: [:index], controller: 'find_all_invoice_items'
        resources :random, only: [:index]
      end

      resources :invoice_items, only: :none do
        resources :invoice, only: [:index], controller: 'invoice_items/invoice'
        resources :item, only: [:index], controller: 'invoice_items/item'
      end

      namespace :transactions do
        resources :find, only: [:index], controller: 'find_transaction'
        resources :find_all, only: [:index], controller: 'find_all_transactions'
        resources :random, only: [:index]
      end

      resources :transactions, only: :none  do
        resources :invoice, only: [:index], controller: 'transactions/invoice'
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