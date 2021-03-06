require 'rails_helper'

feature "user signs in" do
  let(:user1) { FactoryGirl.create(:user) }

  scenario "user enters valid sign in information" do
    sign_in(user1)

    expect(page).to have_content "Signed in successfully."
  end

  scenario "user enters invalid sign in information" do
    visit new_user_session_path

    fill_in "Email", with: user1.email
    fill_in "Password", with: "Incorrect"
    click_on "Log in"

    expect(page).to have_content "Invalid email or password."
  end
end
