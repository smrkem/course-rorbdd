require 'rails_helper'

RSpec.feature "Signing in a user" do
  before do
    @user = create(:user)
  end

  scenario "with valid credentials" do
    visit "/"
    expect(page).not_to have_link("Sign out")

    click_link "Sign in"
    fill_in "Email", with: @user.email
    fill_in "Password", with: @user.password
    click_button "Log in"

    expect(page).to have_content("Signed in successfully.")
    expect(page).to have_content("Signed in as #{@user.email}")
    expect(page).to have_link("Sign out")
    expect(page).not_to have_link("Sign in")
    expect(page).not_to have_link("Sign up")
  end

end
