FactoryGirl.define do

  factory :customer do
    sequence :first_name do |n|
      "Spungebob#{n}"
    end

    last_name 'Squarepants'

    sequence :created_at do |n|
      "20#{n}-03-27 14:54:12 UTC,20#{n}-03-27 14:54:12 UTC"
    end

    sequence :updated_at do |n|
      "20#{n}-03-27 14:54:12 UTC,20#{n}-03-27 14:54:12 UTC"
    end
  end
end