require 'rails_helper'

RSpec.describe User, type: :model do
  it "has a valid factory" do
    expect(FactoryGirl.build(:user)).to be_valid
  end

  it "is invalid without an email" do
    user = FactoryGirl.build(:user, email: "")
    expect(user).not_to be_valid
  end

  it "is invalid without a password" do
    user = FactoryGirl.build(:user, password: "")
    expect(user).not_to be_valid
  end
end
