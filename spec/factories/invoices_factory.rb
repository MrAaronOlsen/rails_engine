FactoryGirl.define do

  factory :invoice do
    status 'shipped'
    customer
    merchant

    sequence :created_at do |n|
      "20#{n.to_s.rjust(2, '0')}-03-27 14:54:12 UTC"
    end

    sequence :updated_at do |n|
      "20#{n.to_s.rjust(2, '0')}-03-27 14:54:12 UTC"
    end

    trait :with_transactions do
      after(:create) do |object|
        object.transactions << create_list(:transaction, 1)
      end
    end

    trait :with_failed_transactions do
      after(:create) do |object|
        object.transactions << create_list(:transaction, 1, result: 'failed')
      end
    end

    trait :with_invoice_items do
      after(:create) do |object|
        object.invoice_items << create_list(:invoice_item, 3)
        object.transactions << create_list(:transaction, 1)
        object.created_at = "2067-03-27 14:54:12 UTC"
      end
    end
  end
end