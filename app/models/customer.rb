class Customer <  ApplicationRecord
  has_many :invoices, dependent: :destroy
  has_many :merchants, through: :invoices
  
  validates_presence_of :first_name, :last_name
end