FactoryGirl.define do
  factory :restaurant do
    vendor
    name "first_restaurant"
    description "restaurant_description"
    phone "555-666-1234"
    email {"#{name}.@example.com"}
    address "Sunnyvale"
    rating 1
  end
end
