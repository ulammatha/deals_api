include ActionDispatch::TestProcess

FactoryGirl.define do
  factory :deal do
    restaurant
    name "deal_name"
    description "fake description"
    current_amount 12.45
    previous_amount 25.00
    expiry 10.days.from_now
    available_coupons 10
    sold_coupons 0
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
