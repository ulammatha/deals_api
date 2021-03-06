include ActionDispatch::TestProcess

FactoryGirl.define do
  factory :restaurant do
    vendor
    name "first_restaurant"
    description "restaurant_description"
    phone "555-666-1234"
    email {"#{name}.@example.com"}
    address "Sunnyvale"
    rating 1
    image {
      fixture_file_upload(
        Rails.root.join(
          "spec",
          "images",
          "default.jpg"
        ),
        "image/jpg"
      )
    }
  end
end
