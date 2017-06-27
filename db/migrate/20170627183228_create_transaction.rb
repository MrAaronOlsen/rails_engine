class CreateTransaction < ActiveRecord::Migration[5.1]
  def change
    create_table :transactions do |t|
      t.integer :credit_card_number, limit: 8
      t.string :credit_card_experation_date
      t.integer :result
      t.references :invoice, foreign_key: true

      t.timestamps null: false
    end
  end
end
