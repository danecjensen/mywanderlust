# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :destination do
    trip_id 1
    name "MyString"
    photo_url "MyString"
    address "MyString"
    cross_street "MyString"
    city "MyString"
    state "MyString"
    postal_code "MyString"
    country "MyString"
    lat 1.5
    lng 1.5
    distance 1
  end
end
