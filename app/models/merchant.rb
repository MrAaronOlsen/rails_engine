class Merchant <  ApplicationRecord
  has_many :items, dependent: :destroy
  has_many :invoices, dependent: :destroy

  validates_presence_of :name


  class << self
    def most_revenue(quantity)
      Merchant.find_by_sql [
        "SELECT merchants.name, merchants.id, sum(invoice_items.quantity * invoice_items.unit_price) AS total_revenue
        FROM merchants
        INNER JOIN invoices ON invoices.merchant_id = merchants.id
        INNER JOIN invoice_items ON invoice_items.invoice_id = invoices.id
        INNER JOIN transactions on transactions.invoice_id = invoices.id
        WHERE transactions.result = 1
        GROUP BY merchants.id, merchants.name
        ORDER BY total_revenue DESC
        LIMIT ?", quantity ]
    end

    def most_items(quantity)
      Merchant.find_by_sql [
        "SELECT merchants.name, merchants.id, sum(invoice_items.quantity) AS total_revenue
        FROM merchants
        INNER JOIN invoices ON invoices.merchant_id = merchants.id
        INNER JOIN invoice_items ON invoice_items.invoice_id = invoices.id
        INNER JOIN transactions on transactions.invoice_id = invoices.id
        WHERE transactions.result = 1
        GROUP BY merchants.id, merchants.name
        ORDER BY total_revenue DESC
        LIMIT ?", quantity ]
    end

    def revenue(date)
      { "total_revenue" => Invoice.joins(:invoice_items).joins(:transactions)
        .where('transactions.result = 1 and invoices.created_at = ?', date)
        .sum('invoice_items.quantity * invoice_items.unit_price') }
    end
  end
end

