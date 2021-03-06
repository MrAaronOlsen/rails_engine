FactoryGirl.define do

  factory :transaction do
    credit_card_number 1234567890123456789
    credit_card_expiration_date ''
    result 'success'
    invoice

    sequence :created_at do |n|
      "20#{n.to_s.rjust(2, '0')}-03-27 14:54:12 UTC"
    end

    sequence :updated_at do |n|
      "20#{n.to_s.rjust(2, '0')}-03-27 14:54:12 UTC"
    end
  end
end