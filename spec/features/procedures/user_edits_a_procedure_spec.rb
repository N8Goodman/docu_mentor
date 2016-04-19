require 'rails_helper'

feature "user edits a procedure " do
  let!(:procedure1) { FactoryGirl.create(:procedure) }
  let!(:admin1) { FactoryGirl.create(:user, admin: true) }

  scenario 'user navigates to edit form' do
    sign_in(admin1)
    visit '/procedures'

    click_on procedure1.procedure_name

    click_on "Update Procedure"

    expect(page).to have_content "Update #{procedure1.procedure_name}"
    expect(page).to have_content "Procedure Name"
    expect(page).to have_content "Description"
    expect(page).to have_content "Completion Title"
    expect(page).to have_button "Submit Procedure"
  end

  scenario 'user successfully edits a procedure with a description' do
    sign_in(admin1)
    visit '/procedures'

    click_on procedure1.procedure_name

    click_on "Update Procedure"

    fill_in "Procedure Name", with: "Mortgage Loan"
    fill_in "Description", with: "Application to secure a mortgage for purchasing a home"
    fill_in "Completion Title", with: "Mortgage Finalized"
    click_on "Submit Procedure"

    expect(page).to have_content "Procedure updated!"
    expect(page).to have_content "Mortgage Loan"
    expect(page).to have_content "When completed: Mortgage Finalized"
    expect(page).to have_content "Description: Application to secure a mortgage for purchasing a home"
  end

  scenario 'user successfully edits a procedure without a description' do
    sign_in(admin1)
    visit '/procedures'

    click_on procedure1.procedure_name

    click_on "Update Procedure"

    fill_in "Procedure Name", with: "Mortgage Loan"
    fill_in "Description", with: ""
    fill_in "Completion Title", with: "Mortgage Finalized"
    click_on "Submit Procedure"

    expect(page).to have_content "Procedure updated!"
    expect(page).to have_content "Mortgage Loan"
    expect(page).to_not have_content procedure1.description
    expect(page).to have_content "When completed: Mortgage Finalized"
  end

  scenario 'user tries to edit a procedure without a name' do
    sign_in(admin1)
    visit '/procedures'

    click_on procedure1.procedure_name

    click_on "Update Procedure"

    fill_in "Procedure Name", with: ""
    fill_in "Description", with: "Application to secure a mortgage for purchasing a home"
    fill_in "Completion Title", with: "Mortgage Finalized"
    click_on "Submit Procedure"

    expect(page).to have_content "Procedure name can't be blank"
    expect(page).to_not have_content "When completed: Mortgage Finalized"
    expect(page).to_not have_content "Description: Application to secure a mortgage for purchasing a home"
  end

  scenario 'user tries to edit a procedure without a completion title' do
    sign_in(admin1)
    visit '/procedures'

    click_on procedure1.procedure_name

    click_on "Update Procedure"

    fill_in "Procedure Name", with: "Mortgage Loan"
    fill_in "Description", with: "Application to secure a mortgage for purchasing a home"
    fill_in "Completion Title", with: ""
    click_on "Submit Procedure"

    expect(page).to have_content "Completion status can't be blank"
    expect(page).to_not have_content "Description: Application to secure a mortgage for purchasing a home"
  end

  scenario 'user tries to edit a procedure without any fields completed' do
    sign_in(admin1)
    visit '/procedures'

    click_on procedure1.procedure_name

    click_on "Update Procedure"

    fill_in "Procedure Name", with: ""
    fill_in "Description", with: ""
    fill_in "Completion Title", with: ""
    click_on "Submit Procedure"

    expect(page).to have_content "Completion status can't be blank"
    expect(page).to have_content "Procedure name can't be blank"
    expect(page).to_not have_content "Description: Application to secure a mortgage for purchasing a home"
    expect(page).to_not have_content "Procedure updated!"
  end

  scenario 'user tries to edit a procedure without making changes' do
    sign_in(admin1)
    visit '/procedures'

    click_on procedure1.procedure_name

    click_on "Update Procedure"

    click_on "Submit Procedure"

    expect(page).to have_content "Procedure updated!"
    expect(page).to have_content procedure1.procedure_name
    expect(page).to have_content procedure1.description
    expect(page).to have_content procedure1.completion_status
  end
end
