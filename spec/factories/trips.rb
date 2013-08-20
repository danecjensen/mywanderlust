# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :trip do
    name "MyString"
    current_lat 1.5
    current_lng 1.5
  end
end
