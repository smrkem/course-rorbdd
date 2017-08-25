require 'rails_helper'

RSpec.describe Comment, type: :model do
  it "has a valid factory" do
    expect(FactoryGirl.build(:comment)).to be_valid
  end

  it "is invalid without a body" do
    comment = FactoryGirl.build(:comment, body: "")
    expect(comment).not_to be_valid
  end

  it "is invalid without an artricle" do
    comment = FactoryGirl.build(:comment, article: nil)
    expect(comment).not_to be_valid
  end

  it "is invalid without a user" do
    comment = FactoryGirl.build(:comment, user: nil)
    expect(comment).not_to be_valid
  end
end
