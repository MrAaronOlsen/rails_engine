class Merchant <  ApplicationRecord
  has_many :items, dependent: :destroy
  has_many :invoices, dependent: :destroy

  has_many :customers, through: :invoices

  validates_presence_of :name

  def total_revenue_for
    self.invoices.joins(:invoice_items).joins(:transactions)
      .where('transactions.result = 1')
      .sum('invoice_items.unit_price * invoice_items.quantity')
  end

  def total_revenue_by_date_for(date)
    self.invoices.joins(:invoice_items).joins(:transactions)
      .where('transactions.result = 1 and invoices.created_at = ?', date)
      .sum('invoice_items.unit_price * invoice_items.quantity')
  end

  def favorite_customer_for
    self.customers
      .select("customers.*, count('invoices.customer_id') AS invoice_count")
      .joins(:invoices).group('customers.id')
      .order('invoice_count DESC').limit(1)
  end

  class << self
    def with_most_revenue(quantity)
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

    def with_most_items(quantity)
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

    def total_revenue_by_date(date)
      Invoice.joins(:invoice_items).joins(:transactions)
        .where('transactions.result = 1 and invoices.created_at = ?', date)
        .sum('invoice_items.quantity * invoice_items.unit_price')
    end
  end
end

