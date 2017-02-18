FactoryGirl.define do
  factory :post do
    user

    sequence(:name) { |n| "Title - #{n}" }
    description     { Faker::Lorem.paragraph }
    author_ip       { Faker::Internet.ip_v4_address }
  end

  trait :with_rates do
    after(:create) do |post|
      post.rates << create_list(:rate, 2)
    end
  end
end
