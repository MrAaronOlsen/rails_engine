FactoryGirl.define do

  factory :invoice_item do
    quantity 3
    unit_price 345.56
    item
    invoice
  end
end