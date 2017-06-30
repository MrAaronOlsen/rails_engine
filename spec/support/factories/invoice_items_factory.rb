FactoryGirl.define do

  factory :invoice_item do
    quantity 3
    unit_price 1000.00
    item
    invoice

    sequence :created_at do |n|
      "20#{n.to_s.rjust(2, '0')}-03-27 14:54:12 UTC"
    end

    sequence :updated_at do |n|
      "20#{n.to_s.rjust(2, '0')}-03-27 14:54:12 UTC"
    end

    trait :with_same_date do
      before(:create) do |object, evaluator|
        object.invoice.transactions = create_list(:transaction, 1)
      end
    end
  end
end