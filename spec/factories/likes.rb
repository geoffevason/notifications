# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :like do
    user nil
    likeable_type "Post"
    likeable_id 1
  end
end
