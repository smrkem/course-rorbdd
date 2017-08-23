FactoryGirl.define do
  sequence :email do |n|
    "mail_#{n}@example.com"
  end

  factory :user do
    email { generate(:email) }
    password "testpassword"
  end
end
