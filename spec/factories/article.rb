FactoryGirl.define do
  factory :article do
    title "Test Title"
    body "Sample body"
    association(:user)
  end
end
