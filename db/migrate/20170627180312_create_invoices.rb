class CreateInvoices < ActiveRecord::Migration[5.1]
  def change
    create_table :invoices do |t|
      t.integer :status
      t.references :customer, foreign_key: true
      t.references :merchant, foreign_key: true

      t.timestamps null: false
    end
  end
end
