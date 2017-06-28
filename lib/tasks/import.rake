require_relative 'loader'

desc "Import product from csv file"

task :import => [:environment] do

  Customer.destroy_all
  Merchant.destroy_all
  Item.destroy_all
  Invoice.destroy_all
  InvoiceItem.destroy_all
  Transaction.destroy_all

# Customers

  puts 'Loading Customers'
  Loader.new("lib/data/customers.csv").load_data do |row|
    Customer.create(row)
  end
  puts "Loaded #{Customer.count} Customers"

# Merchants

  puts 'Loading Merchants'
  Loader.new("lib/data/merchants.csv").load_data do |row|
    Merchant.create(row)
  end
  puts "Loaded #{Merchant.count} Merchants"

# Items

  puts 'Loading Items'
  Loader.new("lib/data/items.csv").load_data do |row|
    Item.create(row)
  end
  puts "Loaded #{Item.count} Items"

# Invoices

  puts 'Loading Invoices'
  Loader.new("lib/data/invoices.csv").load_data do |row|
    Invoice.create(row)
  end
  puts "Loaded #{Invoice.count} Invoices"

# Invoice_Items

  puts 'Loading Invoice_Items'
  Loader.new("lib/data/invoice_items.csv").load_data do |row|
    InvoiceItem.create(row)
  end
  puts "Loaded #{InvoiceItem.count} Invoice_Items"

# Transactions

  puts 'Loading Transactions'
  Loader.new("lib/data/transactions.csv").load_data do |row|
    Transaction.create(row)
  end
  puts "Loaded #{Transaction.count} Transactions"
end