FactoryGirl.define do

  factory :merchant do
    name 'Scrooge McDuck'

    sequence :created_at do |n|
      "20#{n.to_s.rjust(2, '0')}-03-27 14:54:12 UTC"
    end

    sequence :updated_at do |n|
      "20#{n.to_s.rjust(2, '0')}-03-27 14:54:12 UTC"
    end

    trait :with_invoices do
      after(:create) do |object|
        object.invoices << create_list(:invoice, 3, :with_invoice_items)
      end
    end
  end
end