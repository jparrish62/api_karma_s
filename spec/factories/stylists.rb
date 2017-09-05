FactoryGirl.define do
  factory :stylist do
    first_name "String"
    last_name "String"
    email "String"
    bio  "String"
    user_id 3
    user
  end
end
