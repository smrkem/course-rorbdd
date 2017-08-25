FactoryGirl.define do
  factory :comment do
    body "Sample comment body"
    association(:article)
    association(:user)
  end
end
