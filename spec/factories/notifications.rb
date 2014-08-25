# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :notification do
    user
    source_user
    source_object { |a| a.association(:post) }
    notification_type Faker::Lorem.sentence(3)
    read false
  end

  factory :notification_preference do
    user
    notification_type Faker::Lorem.sentence(3)
    send_email true
  end
end
