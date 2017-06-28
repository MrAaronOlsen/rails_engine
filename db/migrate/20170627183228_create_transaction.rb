class CreateTransaction < ActiveRecord::Migration[5.1]
  def change
    create_table :transactions do |t|
      t.string :credit_card_number
      t.string :credit_card_expiration_date
      t.integer :result
      t.references :invoice, foreign_key: true

      t.timestamps null: false
    end
  end
end
