require 'rails_helper'

feature "user adds a new procedure " do

  scenario 'user successfully navigates to add procedure form' do
    visit '/procedures'

    click_on "Add a new Procedure"
    expect(page).to have_content "Procedure Name"
    expect(page).to have_content "Description"
    expect(page).to have_content "Completion Title"
    expect(page).to have_button "Submit Procedure"
  end

  scenario 'user successfully adds a procedure with a description' do
    visit new_procedure_path

    fill_in "Procedure Name", with: "Mortgage Loan"
    fill_in "Description", with: "Application to secure a mortgage for purchasing a home"
    fill_in "Completion Title", with: "Mortgage Finalized"
    click_on "Submit Procedure"

    expect(page).to have_content "Procedure created!"
    expect(page).to have_content "Mortgage Loan"
    expect(page).to have_content "When completed: Mortgage Finalized"
    expect(page).to have_content "Description: Application to secure a mortgage for purchasing a home"
  end

  scenario 'user successfully adds a procedure without a description' do
    visit new_procedure_path

    fill_in "Procedure Name", with: "Mortgage Loan"
    fill_in "Completion Title", with: "Mortgage Finalized"
    click_on "Submit Procedure"

    expect(page).to have_content "Procedure created!"
    expect(page).to have_content "Mortgage Loan"
    expect(page).to have_content "When completed: Mortgage Finalized"
  end

  scenario 'user tries to add a procedure without a name' do
    visit new_procedure_path

    fill_in "Description", with: "Application to secure a mortgage for purchasing a home"
    fill_in "Completion Title", with: "Mortgage Finalized"
    click_on "Submit Procedure"

    expect(page).to have_content "Procedure name can't be blank"
    expect(page).to_not have_content "When completed: Mortgage Finalized"
    expect(page).to_not have_content "Description: Application to secure a mortgage for purchasing a home"
  end

  scenario 'user tries to add a procedure without a completion title' do
    visit new_procedure_path

    fill_in "Procedure Name", with: "Mortgage Loan"
    fill_in "Description", with: "Application to secure a mortgage for purchasing a home"
    click_on "Submit Procedure"

    expect(page).to have_content "Completion status can't be blank"
    expect(page).to_not have_content "Mortgage Loan"
    expect(page).to_not have_content "Description: Application to secure a mortgage for purchasing a home"
  end
end
