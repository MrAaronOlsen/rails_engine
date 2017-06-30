class Item < ApplicationRecord
  belongs_to :merchant

  has_many :invoice_items
  has_many :invoices, through: :invoice_items

  validates_presence_of :name, :description, :unit_price

  before_create :convert_price

  def best_day
    Invoice.find_by_sql [
      "SELECT invoices.created_at, sum(invoice_items.quantity) AS items_sold
      FROM invoice_items
      JOIN invoices ON invoice_items.invoice_id = invoices.id
        AND invoice_items.item_id = ?
      JOIN transactions ON transactions.invoice_id = invoices.id
      WHERE transactions.result = 1
      GROUP BY invoices.id, invoices.created_at
      ORDER BY items_sold DESC, invoices.id, created_at DESC
      LIMIT 1", self.id ]
  end

  class << self
    def random
      Item.limit(1).order("RANDOM()")
    end

    def most_revenue(quantity)
      Item.find_by_sql [
        "SELECT items.*, sum(invoice_items.quantity * invoice_items.unit_price) AS total_revenue
        FROM items
        INNER JOIN invoice_items ON invoice_items.item_id = items.id
        INNER JOIN invoices ON invoice_items.invoice_id = invoices.id
        INNER JOIN transactions ON transactions.invoice_id = invoices.id
        WHERE transactions.result = 1
        GROUP BY items.id
        ORDER BY total_revenue DESC
        LIMIT ?", quantity ]
    end

    def most_items(quantity)
      Item.find_by_sql [
        "SELECT items.*, sum(invoice_items.quantity) AS total_items
        FROM items
        INNER JOIN invoice_items ON invoice_items.item_id = items.id
        INNER JOIN invoices ON invoice_items.invoice_id = invoices.id
        INNER JOIN transactions ON transactions.invoice_id = invoices.id
        WHERE transactions.result = 1
        GROUP BY items.id
        ORDER BY total_items DESC
        LIMIT ?", quantity ]
    end
  end

  private

  def convert_price
    self.unit_price = '%.2f' % (unit_price.to_f/100)
  end
end