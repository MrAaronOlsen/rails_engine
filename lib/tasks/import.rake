require_relative 'loader'

desc "Import product from csv file"

task :import => [:environment] do

  puts 'Loading Customers'
  Loader.new("lib/data/customers.csv").load_data( Customer,
                                                  :id,
                                                  :first_name,
                                                  :last_name,
                                                  :created_at,
                                                  :updated_at )
  puts "Loaded #{Customer.count} Customers"

  puts 'Loading Merchants'
  Loader.new("lib/data/merchants.csv").load_data( Merchant,
                                                  :id,
                                                  :name,
                                                  :created_at,
                                                  :updated_at )

  puts "Loaded #{Merchant.count} Merchants"

  puts 'Loading Items'
  Loader.new("lib/data/items.csv").load_data(     Item,
                                                  :id,
                                                  :name,
                                                  :description,
                                                  :unit_price,
                                                  :merchant_id,
                                                  :created_at,
                                                  :updated_at )
  puts "Loaded #{Item.count} Items"

  puts 'Loading Invoices'
  Loader.new("lib/data/invoices.csv").load_data(  Invoice,
                                                  :status,
                                                  :merchant_id,
                                                  :customer_id,
                                                  :created_at,
                                                  :updated_at )
  puts "Loaded #{Invoice.count} Invoices"

  puts 'Loading Invoice_Items'
  Loader.new("lib/data/invoice_items.csv").load_data(  InvoiceItem,
                                                  :quantity,
                                                  :unit_price,
                                                  :invoice_id,
                                                  :item_id,
                                                  :created_at,
                                                  :updated_at )

  puts "Loaded #{InvoiceItem.count} Invoice_Items"

  puts 'Loading Transactions'
  Loader.new("lib/data/transactions.csv").load_data(  Transaction,
                                                  :result,
                                                  :credit_card_number,
                                                  :credit_card_experation_date,
                                                  :invoice_id,
                                                  :created_at,
                                                  :updated_at )
  puts "Loaded #{Transaction.count} Transactions"
end