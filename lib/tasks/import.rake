require 'csv'

desc "Import product from csv file"

task :import => [:environment] do
  file_address = "lib/data/customers.csv"
end