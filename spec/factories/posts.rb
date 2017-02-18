FactoryGirl.define do
  factory :post do
    user

    sequence(:name) { |n| "Title - #{n}" }
    description     { Faker::Lorem.paragraph }
    author_ip       { Faker::Internet.ip_v4_address }
  end
end
