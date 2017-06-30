class InvoiceItem < ApplicationRecord
  belongs_to :invoice
  belongs_to :item

  validates_presence_of :quantity, :unit_price

  before_create :convert_price

  def self.random
    InvoiceItem.limit(1).order("RANDOM()")
  end

  private

  def convert_price
    self.unit_price = '%.2f' % (unit_price.to_f/100)
  end
end