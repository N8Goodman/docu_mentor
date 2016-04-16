FactoryGirl.define do
  sequence :email do |n|
    "user#{n}@gmail.com"
  end

  sequence :user_name do |n|
    "user#{n}"
  end

  factory :user do
    user_name
    email
    password "password"
    admin "false"
  end
end
