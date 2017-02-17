FactoryGirl.define do
  factory :rate do
    post
    value { rand(1..5) }
  end  
end
