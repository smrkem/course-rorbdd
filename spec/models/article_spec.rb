require 'rails_helper'

RSpec.describe Article, type: :model do
  it "has a valid factory" do
    expect(FactoryGirl.build(:article)).to be_valid
  end

  it "is invalid without a title" do
    article = FactoryGirl.build(:article, title: "")
    expect(article).not_to be_valid
  end

  it "is invalid without a body" do
    article = FactoryGirl.build(:article, body: "")
    expect(article).not_to be_valid
  end

  it "is invalid without a user" do
    article = FactoryGirl.build(:article, user: nil)
    expect(article).not_to be_valid
  end

end
