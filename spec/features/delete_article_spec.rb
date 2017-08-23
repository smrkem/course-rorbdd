require 'rails_helper'

RSpec.feature "Deleting an Article" do
  before do
    @user = create(:user)
    login_as(@user)
    @article = create(:article, user: @user)
  end

  scenario "A user deletes an article" do
    visit "/"
    click_link @article.title
    click_link "Delete Article"

    expect(page).to have_content("Article has been deleted")
    expect(current_path).to eq(articles_path)
  end
end
