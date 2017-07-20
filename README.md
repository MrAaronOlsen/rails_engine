## Rails Engine
Rails Engine is an example API app built on Rails serving up endpoints with search functionality and business logic.

### Dependencies

* Ruby 2.4.1
* Rails 5.1.2

### Install

* Clone repo, 
* $ bundle install, to install all dependencies.
* $ bundle update, to update gems. Gems are versioned, but some need to be up to date.
* $ rake db:setup, to initialize database.
* $ rake import, to seed database.
* $ rspec, to run test suite.

### Use

* $ rails s, to spin up local server

#### Endpoints

  * All objects have:
    * index, /api/v1/object
    * show, /api/v1/object/object.id
    * find
      * /api/v1/object/find?object.attribute=attribute
    * find_all
      * /api/v1/object/find_all?object.attribute=attribute
    * random, /api/v1/object/random
    
##### Object Attributes

 * Customers: id, first_name, last_name, created_at, updated_at
 * Merchants: id, name, created_at, updated_at
 * Invoices: id, customer_id, merchant_id, status, created_at, updated_at
 * Items: id, name, description, unit_price, merchant_id, created_at, updated_at
 * Invoice Items: id, item_id, invoice_id, quantity, unit_price, created_at, updated_at
 * Transactions: id, invoice_id, credit_card_number, result, created_at, updated_at

 * [Schema](http://ondras.zarovi.cz/sql/demo/) saved as: rails-engine-mraaronolsen
  
#### Relationships
##### Format /api/v1/object/:id/relationship
 
  * merchants <- object
    * items
    * invoices
  * customers
    * invoices
    * transactions
  * invoices
    * invoice_items
    * items
    * customer
    * merchant
  * invoice_items
    * invoice
    * item
  * items
    * invoice_items
    * merchant
  * transaction
    * invoice

#### Business Logic

##### Merchants
 * /api/v1/merchants/most_revenue?quantity=x (returns the top x merchants ranked by total revenue)
 * /api/v1/merchants/most_items?quantity=x (returns the top x merchants ranked by total number of items sold)
 * /api/v1/merchants/revenue?date=x (returns the total revenue for date x across all merchants)

 * /api/v1/merchants/:id/revenue returns the total revenue for that merchant across successful transactions
 * /api/v1/merchants/:id/revenue?date=x returns the total revenue for that merchant for a specific invoice date x
 * /api/v1/merchants/:id/favorite_customer returns the customer who has conducted the most total number of successful transactions.
 * /api/v1/merchants/:id/customers_with_pending_invoices (returns a collection of customers which have pending (unpaid) invoices)
  
##### Items
 * /api/v1/items/most_revenue?quantity=x ( returns the top x items ranked by total revenue generated )
 * /api/v1/items/most_items?quantity=x ( returns the top x item instances ranked by total number sold )
 * /api/v1/items/:id/best_day ( returns the date with the most sales for the given item using the invoice date )
   
##### Customers
 * /api/v1/customers/:id/favorite_merchant ( returns a merchant where the customer has conducted the most successful transactions )
