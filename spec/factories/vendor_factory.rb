FactoryGirl.define do
  factory :vendor do
    first_name "first_name"
    last_name "last_name"
    phone "555-234-1234"
    email {"#{first_name}.#{last_name}@example.com"}
  end
end