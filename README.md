# README

Items: id, name, description, unit_price, merchant_id, created_at, updated_at

Customers: id, first_name, last_name, created_at, updated_at

Invoice Items: id, item_id, invoice_id, quantity, unit_price, created_at, updated_at

Invoices: id, customer_id, merchant_id, status, created_at, updated_at

Merchants: id, name, created_at, updated_at

Transactions: id, invoice_id, credit_card_number, credit_card_expiration_date, result, created_at, updated_at

Things you may want to cover:

* Ruby 2.4.1

* Rails 5.1.2

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
