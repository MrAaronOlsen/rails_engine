class Customer <  ApplicationRecord
  has_many :invoices, dependent: :destroy
  has_many :merchants, through: :invoices
  has_many :transactions, through: :invoices

  validates_presence_of :first_name, :last_name

  def fav_merchant
    Merchant.select("merchants.*, count('merchants.invoices') AS total_invoices")
      .joins(:invoices).where("invoices.customer_id = ?", self.id)
      .group("merchants.id")
      .order("total_invoices DESC").limit(1)
  end
end