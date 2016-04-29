require 'rails_helper'

feature "user adds a new stage " do
  let!(:admin1) { FactoryGirl.create(:user, admin: true) }
  scenario 'user successfully navigates to add stage form' do
    sign_in(admin1)
    visit '/stages'

    click_on "Add a new Stage"

    expect(page).to have_content "Stage Name"
    expect(page).to have_content "Description"
    expect(page).to have_content "Completion Title"
    expect(page).to have_button "Submit Stage"

  end

  scenario 'user successfully adds a stage with a description' do
    sign_in(admin1)
    visit new_stage_path

    fill_in "Stage Name", with: "Initial Application"
    fill_in "Description", with: "The first stage of the process"
    fill_in "Completion Title", with: "Approved"
    click_on "Submit Stage"

    expect(page).to have_content "Stage created!"
    expect(page).to have_content "Initial Application"
    expect(page).to have_content "When completed: Approved"
    expect(page).to have_content "Description: The first stage of the process"
  end

  scenario 'user successfully adds a stage without a description' do
    sign_in(admin1)
    visit new_stage_path

    fill_in "Stage Name", with: "Initial Application"
    fill_in "Completion Title", with: "Approved"
    click_on "Submit Stage"

    expect(page).to have_content "Stage created!"
    expect(page).to have_content "Initial Application"
    expect(page).to have_content "When completed: Approved"
  end

  scenario 'user tries to add a stage without a name' do
    sign_in(admin1)
    visit new_stage_path

    fill_in "Description", with: "The first stage of the process"
    fill_in "Completion Title", with: "Approved"
    click_on "Submit Stage"

    expect(page).to have_content "Stage name can't be blank"
    expect(page).to_not have_content "When completed: Approved"
    expect(page).to_not have_content "Description: The first stage of the processr"
  end

  xscenario 'user tries to add a stage without a completion title' do
    sign_in(admin1)
    visit new_stage_path

    fill_in "Stage Name", with: "Initial Application"
    fill_in "Description", with: "The first stage of the process"
    click_on "Submit Stage"

    expect(page).to have_content "Completion status can't be blank"
    expect(page).to_not have_content "Initial Application"
    expect(page).to_not have_content "Description: The first stage of the processr"
  end
end
