class Transaction < ApplicationRecord
  belongs_to :invoice

  validates_presence_of :credit_card_number, :result

  enum result: ['failed', 'success']

  def self.random
    Transaction.limit(1).order("RANDOM()")
  end
end