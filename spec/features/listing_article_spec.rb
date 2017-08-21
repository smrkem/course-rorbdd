require "rails_helper"

RSpec.feature "Listing Articles" do
  before do
    @article1 = create(:article, title: "First Article", body: "Fist article content")
    @article2 = create(:article, title: "Second Article", body: "Second article content")
  end

  scenario "A user lists all articles" do
    visit "/"

    expect(page).to have_content(@article1.title)
    expect(page).to have_content(@article1.body)
    expect(page).to have_content(@article2.title)
    expect(page).to have_content(@article2.body)
    expect(page).to have_link(@article1.title)
    expect(page).to have_link(@article2.title)
  end
end
