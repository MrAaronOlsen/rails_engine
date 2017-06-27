FactoryGirl.define do

  factory :invoice_item do
    quantity 3
    unit_price 345.56
    item
    invoice

    sequence :created_at do |n|
      "20#{n}-03-27 14:54:12 UTC,20#{n}-03-27 14:54:12 UTC"
    end

    sequence :updated_at do |n|
      "20#{n}-03-27 14:54:12 UTC,20#{n}-03-27 14:54:12 UTC"
    end
  end
end