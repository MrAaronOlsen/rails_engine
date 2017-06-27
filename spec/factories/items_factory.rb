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
  end
end