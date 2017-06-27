FactoryGirl.define do

  factory :transaction do
    credit_card_number 1234567890123456789
    credit_card_experation_date ''
    result 'success'
    invoice
  end
end