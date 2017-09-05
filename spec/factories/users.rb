FactoryGirl.define do
  factory :user do
    email {FFaker::Internet.email}
    user_name "foo"
    password "12345678"
    password_confirmation "12345678"
  end
end
