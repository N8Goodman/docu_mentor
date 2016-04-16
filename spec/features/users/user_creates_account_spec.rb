require 'rails_helper'

# [X] As a prospective user
# I want to create an account
# So that I can post items and review them

feature "user authentication" do

  scenario "user enters valid data to create account" do
    visit new_user_registration_path

    fill_in "Username", with: "User1"
    fill_in "Email", with: "user1@example.com"
    fill_in "Password", with: "documents4days"
    fill_in "Password confirmation", with: "documents4days"
    click_on "Create Account"

    expect(page).to have_content "Welcome! You have signed up successfully."
  end

  scenario "user enters invalid data to create account" do
    visit new_user_registration_path

    fill_in "Username", with: "User2"
    fill_in "Password", with: "documents4days"
    fill_in "Password confirmation", with: "Ooga Booga"
    click_on "Create Account"

    expect(page).to_not have_content "Welcome! You have signed up successfully."
    expect(page).to have_content "confirmation doesn't match Password"
    expect(page).to have_content "Email can't be blank"
  end
end
