FactoryGirl.define do

  sequence :email do |n|
    "email#{n}@example.com"
  end

  factory :user do
    name Faker::Name.name
    email
    password "please123"
  end
end
