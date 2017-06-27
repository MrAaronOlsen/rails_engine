Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do

      namespace :customers do
        resources :find, only: [:index], controller: 'find_customer'
        resources :find_all, only: [:index], controller: 'find_all_customers'
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
