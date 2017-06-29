FactoryGirl.define do

  factory :invoice_item do
    sequence :quantity do |i|
      i
    end

    sequence :unit_price do |i|
      345.56 + (i*10)
    end

    item
    invoice

    sequence :created_at do |n|
      "20#{n.to_s.rjust(2, '0')}-03-27 14:54:12 UTC"
    end

    sequence :updated_at do |n|
      "20#{n.to_s.rjust(2, '0')}-03-27 14:54:12 UTC"
    end
  end
end