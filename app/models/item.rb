class Item < ApplicationRecord
  belongs_to :merchant

  has_many :invoice_items
  has_many :invoices, through: :invoice_items

  validates_presence_of :name, :description, :unit_price

  before_create :convert_price

  private

  def convert_price
    self.unit_price = '%.2f' % (unit_price.to_f/100)
  end
end