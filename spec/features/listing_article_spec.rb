require "rails_helper"

RSpec.feature "Listing Articles" do
  before do
    @user = create(:user)
    @article1 = create(:article, title: "First Article", body: "Fist article content")
    @article2 = create(:article, title: "Second Article", body: "Second article content")
  end

  scenario "A user lists all articles when not logged in" do
    visit "/"

    expect(page).to have_content(@article1.title)
    expect(page).to have_content(@article1.body)
    expect(page).to have_content(@article2.title)
    expect(page).to have_content(@article2.body)
    expect(page).to have_link(@article1.title)
    expect(page).to have_link(@article2.title)
    expect(page).not_to have_link("New Article")
  end

  scenario "A user lists all articles when logged in" do
    login_as(@user)
    visit "/"

    expect(page).to have_content(@article1.title)
    expect(page).to have_content(@article1.body)
    expect(page).to have_content(@article2.title)
    expect(page).to have_content(@article2.body)
    expect(page).to have_link(@article1.title)
    expect(page).to have_link(@article2.title)
    expect(page).to have_link("New Article")
  end

  scenario "A user has no articles" do
    Article.delete_all
    visit "/"

    expect(page).not_to have_content(@article1.title)
    expect(page).not_to have_content(@article2.title)

    within ("h1#no-articles") do
      expect(page).to have_content("There are no articles.")
    end
  end
end
