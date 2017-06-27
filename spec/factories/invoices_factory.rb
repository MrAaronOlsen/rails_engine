FactoryGirl.define do

  factory :invoice do
    status 'shipped'
    customer
    merchant

    sequence :created_at do |n|
      "20#{n}-03-27 14:54:12 UTC,20#{n}-03-27 14:54:12 UTC"
    end

    sequence :updated_at do |n|
      "20#{n}-03-27 14:54:12 UTC,20#{n}-03-27 14:54:12 UTC"
    end
  end
end