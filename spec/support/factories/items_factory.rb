FactoryGirl.define do

  factory :item do
    name 'Bean'
    description 'Red and shaped like a kidney'
    unit_price 350.89
    merchant

    sequence :created_at do |n|
      "20#{n}-03-27 14:54:12 UTC,20#{n}-03-27 14:54:12 UTC"
    end

    sequence :updated_at do |n|
      "20#{n}-03-27 14:54:12 UTC,20#{n}-03-27 14:54:12 UTC"
    end

    trait :with_invoices do
      before(:create) do |object, evaluator|
        invoice = create(:invoice, created_at: "2000-03-27T14:54:12.000Z")
        object.invoice_items = create_list(:invoice_item, 10, :with_same_date, item: object, invoice: invoice)
      end
    end
  end
end