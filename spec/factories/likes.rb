# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :like do
    user
    likeable { |a| a.association(:post) }
  end
end
