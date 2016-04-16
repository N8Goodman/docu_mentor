require 'rails_helper'

feature "user signs out" do
  let(:user1) { FactoryGirl.create(:user) }

  scenario "user enters valid sign in information and then signs out" do
    sign_in(user1)
    click_on("Sign out")
    expect(page).to have_content "Signed out successfully."
  end
end
