require 'rails_helper'

feature "user adds a new document " do
  let!(:admin1) { FactoryGirl.create(:user, admin: true) }

  scenario 'user successfully navigates to add document form' do
    sign_in(admin1)
    visit '/documents'

    click_on "Add a new Document"

    expect(page).to have_content "Document Name"
    expect(page).to have_content "Description"
    expect(page).to have_content "Completion Title"
    expect(page).to have_button "Submit Document"

  end

  scenario 'user successfully adds a document with a description' do
    sign_in(admin1)
    visit new_document_path

    fill_in "Document Name", with: "Invoice"
    fill_in "Description", with: "An list of items for purchase"
    fill_in "Completion Title", with: "Accepted"
    click_on "Submit Document"

    expect(page).to have_content "Document created!"
    expect(page).to have_content "Invoice"
    expect(page).to have_content "When completed: Accepted"
    expect(page).to have_content "Description: An list of items for purchase"
  end

  scenario 'user successfully adds a document without a description' do
    sign_in(admin1)
    visit new_document_path

    fill_in "Document Name", with: "Invoice"
    fill_in "Completion Title", with: "Accepted"
    click_on "Submit Document"

    expect(page).to have_content "Document created!"
    expect(page).to have_content "Invoice"
    expect(page).to have_content "When completed: Accepted"
  end

  scenario 'user tries to add a document without a name' do
    sign_in(admin1)
    visit new_document_path

    fill_in "Description", with: "An list of items for purchase"
    fill_in "Completion Title", with: "Accepted"
    click_on "Submit Document"

    expect(page).to have_content "Document name can't be blank"
    expect(page).to_not have_content "When completed: Accepted"
    expect(page).to_not have_content "Description: An list of items for purchaser"
  end

  xscenario 'user tries to add a document without a completion title' do
    sign_in(admin1)
    visit new_document_path

    fill_in "Document Name", with: "Invoice"
    fill_in "Description", with: "An list of items for purchase"
    click_on "Submit Document"

    expect(page).to have_content "Completion status can't be blank"
    expect(page).to_not have_content "Invoice"
    expect(page).to_not have_content "Description: An list of items for purchaser"
  end
end
