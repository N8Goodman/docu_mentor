require 'rails_helper'

feature "user edits a new stage " do
  let!(:stage1) { FactoryGirl.create(:stage) }

  scenario 'user successfully navigates to edit stage form' do
    visit '/stages'

    click_on stage1.stage_name

    click_on "Update Stage"

    expect(page).to have_content "Stage Name"
    expect(page).to have_content "Description"
    expect(page).to have_content "Completion Title"
    expect(page).to have_button "Submit Stage"
  end

  scenario 'user successfully edits a stage with a description' do
    visit '/stages'

    click_on stage1.stage_name

    click_on "Update Stage"

    fill_in "Stage Name", with: "Initial Application"
    fill_in "Description", with: "The first stage of the process"
    fill_in "Completion Title", with: "Approved"
    click_on "Submit Stage"

    expect(page).to have_content "Stage updated!"
    expect(page).to have_content "Initial Application"
    expect(page).to have_content "When completed: Approved"
    expect(page).to have_content "Description: The first stage of the process"
  end

  scenario 'user successfully edits a stage without a description' do
    visit '/stages'

    click_on stage1.stage_name

    click_on "Update Stage"

    fill_in "Stage Name", with: "Initial Application"
    fill_in "Description", with: ""
    fill_in "Completion Title", with: "Approved"
    click_on "Submit Stage"

    expect(page).to have_content "Stage updated!"
    expect(page).to have_content "Initial Application"
    expect(page).to_not have_content stage1.description
    expect(page).to have_content "When completed: Approved"
  end

  scenario 'user tries to edit a stage without a name' do
    visit '/stages'

    click_on stage1.stage_name

    click_on "Update Stage"

    fill_in "Stage Name", with: ""
    fill_in "Description", with: "The first stage of the process"
    fill_in "Completion Title", with: "Approved"
    click_on "Submit Stage"

    expect(page).to have_content "Stage name can't be blank"
    expect(page).to_not have_content "Stage updated!"
    expect(page).to_not have_content "When completed: Approved"
    expect(page).to_not have_content "Description: The first stage of the processr"
  end

  scenario 'user tries to edit a stage without a completion title' do
    visit '/stages'

    click_on stage1.stage_name

    click_on "Update Stage"

    fill_in "Stage Name", with: "Initial Application"
    fill_in "Description", with: "The first stage of the process"
    fill_in "Completion Title", with: ""
    click_on "Submit Stage"

    expect(page).to have_content "Completion status can't be blank"
    expect(page).to_not have_content "Stage updated!"
    expect(page).to_not have_content "Description: The first stage of the processr"
  end

  scenario 'user tries to edit a stage without any fields' do
    visit '/stages'

    click_on stage1.stage_name

    click_on "Update Stage"

    fill_in "Stage Name", with: ""
    fill_in "Description", with: ""
    fill_in "Completion Title", with: ""
    click_on "Submit Stage"

    expect(page).to have_content "Completion status can't be blank"
    expect(page).to have_content "Stage name can't be blank"
    expect(page).to_not have_content "Stage updated!"
  end

  scenario 'user tries to edit a stage without making changes' do
    visit '/stages'

    click_on stage1.stage_name

    click_on "Update Stage"

    click_on "Submit Stage"

    expect(page).to have_content "Stage updated!"
    expect(page).to have_content stage1.stage_name
    expect(page).to have_content stage1.description
    expect(page).to have_content stage1.completion_status
  end
end
