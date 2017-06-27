Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do


      namespace :items do
        resources :find, only: [:index], controller: 'find_item'
        resources :find_all, only: [:index], controller: 'find_all_items'
        resources :random, only: [:index], controller: 'random_item'
      end

      resources :items, only: [:show, :index] do
        resources :invoice_items, only: [:index], controller: 'items/invoice_items'
        resources :merchant, only: [:index], controller: 'items/merchant'
      end
    end
  end
end
