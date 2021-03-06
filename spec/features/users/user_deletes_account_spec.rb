require 'rails_helper'

feature "user deletes their account" do
  let!(:user1) { FactoryGirl.create(:user) }
  let!(:user2) { FactoryGirl.create(:user, user_name: "nate") }

  scenario "user deletes account successfully" do
    sign_in(user1)

    click_on("Update Profile")

    click_on "Cancel my account"

    expect(page).to have_content "Bye! Your account has been successfully cancelled. We hope to see you again soon."
  end
end
