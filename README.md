# README

### Object Attributes

* Customers: id, first_name, last_name, created_at, updated_at
* Merchants: id, name, created_at, updated_at
* Invoices: id, customer_id, merchant_id, status, created_at, updated_at
* Items: id, name, description, unit_price, merchant_id, created_at, updated_at
* Invoice Items: id, item_id, invoice_id, quantity, unit_price, created_at, updated_at
* Transactions: id, invoice_id, credit_card_number, credit_card_expiration_date, result, created_at, updated_at

* [Schema](http://ondras.zarovi.cz/sql/demo/) saved as: rails-engine-mraaronolsen

### Dependencies

* Ruby 2.4.1
* Rails 5.1.2

### Install

* Clone repo, 
* $ bundle install, to install all dependencies
* $ rake db:setup, to initialize database
* $ rake import, to seed database

### Use

* $ rails s, to spin up local server
