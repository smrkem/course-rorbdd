require 'rails_helper'

RSpec.feature "Adding comments to articles" do
  before do
    @user1 = create(:user)
    @user2 = create(:user)
    @article = create(:article, user: @user1)
  end

  scenario "permits a signed-in user to comment" do
    login_as(@user2)
    visit "/"

    click_link @article.title
    fill_in "New Comment", with: "Sample comment text"
    click_button "Add Comment"

    expect(page).to have_content "Comment has been created"
    expect(page).to have_content "Sample comment text"
    expect(current_path).to eq article_path(@article)
  end
end
