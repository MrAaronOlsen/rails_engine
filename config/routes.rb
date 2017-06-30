Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do

      namespace :customers do
        resources :find, only: [:index]
        resources :find_all, only: [:index]
        resources :random, only: [:index]

        scope path: ':customer_id' do
          resources :invoices, only: [:index]
          resources :transactions, only: [:index]
          resources :favorite_merchant, only: [:index]
        end
      end

      namespace :merchants do
        resources :find, only: [:index]
        resources :find_all, only: [:index]
        resources :random, only: [:index]
        resources :most_revenue, only: [:index]
        resources :most_items, only: [:index]
        resources :revenue, only: [:index]

        scope path: ':merchant_id' do
          resources :revenue, only: [:index], action: 'show'
          resources :favorite_customer, only: [:index]
          resources :customers_with_pending_invoices, only: [:index]
          resources :items, only: [:index]
          resources :invoices, only: [:index]
        end
      end

      namespace :items do
        resources :find, only: [:index]
        resources :find_all, only: [:index]
        resources :random, only: [:index]
        resources :most_revenue, only: [:index]
        resources :most_items, only: [:index]

        scope path: ':item_id' do
          resources :best_day, only: [:index]
          resources :invoice_items, only: [:index]
          resources :merchant, only: [:index]
        end
      end

      namespace :invoices do
        resources :find, only: [:index]
        resources :find_all, only: [:index]
        resources :random, only: [:index]
        resources :find, only: [:index]
        resources :find_all, only: [:index]

        scope path: ':invoice_id' do
          resources :transactions, only: [:index]
          resources :invoice_items, only: [:index]
          resources :items, only: [:index]
          resources :customer, only: [:index]
          resources :merchant, only: [:index]
        end
      end

      namespace :invoice_items do
        resources :find, only: [:index]
        resources :find_all, only: [:index]
        resources :random, only: [:index]

        scope path: ':invoice_item_id' do
          resources :invoice, only: [:index]
          resources :item, only: [:index]
        end
      end

      namespace :transactions do
        resources :find, only: [:index]
        resources :find_all, only: [:index]
        resources :random, only: [:index]

        scope path: ':transaction_id' do
          resources :invoice, only: [:index]
        end
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