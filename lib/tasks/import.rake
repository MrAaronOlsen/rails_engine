require_relative 'loader'

desc "Import product from csv file"

task :import => [:environment] do

  Loader.new("lib/data/customers.csv").load_data( Customer,
                                                  :id,
                                                  :first_name,
                                                  :last_name,
                                                  :created_at,
                                                  :updated_at )

  Loader.new("lib/data/merchants.csv").load_data( Merchant,
                                                  :id,
                                                  :name,
                                                  :created_at,
                                                  :updated_at )
end