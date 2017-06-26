require 'csv'

desc "Import product from csv file"

task :import => [:environment] do
  file = "lib/data/customers.csv"

  CSV.foreach(file, headers: true) do |row|
    product_hash = row.to_hash
    product = Product.where(id: product_hash["id"])
    if product.count == 1
      product.first.update_attributes(product_hash)
    else
      Product.create!(product_hash)
    end
  end
end