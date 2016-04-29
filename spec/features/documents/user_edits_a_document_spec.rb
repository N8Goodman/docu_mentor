require 'rails_helper'

feature "user edits a new document" do
  let!(:document1) { FactoryGirl.create(:document) }
  let!(:admin1) { FactoryGirl.create(:user, admin: true) }

  scenario 'user successfully navigates to edit document form' do
    sign_in(admin1)
    visit '/documents'

    click_on document1.document_name

    click_on "Update Document"

    expect(page).to have_content "Document Name"
    expect(page).to have_content "Description"
    expect(page).to have_content "Completion Title"
    expect(page).to have_button "Submit Document"
  end

  scenario 'user successfully edits a document with a description' do
    sign_in(admin1)
    visit '/documents'

    click_on document1.document_name

    click_on "Update Document"

    fill_in "Document Name", with: "Invoice"
    fill_in "Description", with: "A list of items for purchase"
    fill_in "Completion Title", with: "Accepted"
    click_on "Submit Document"

    expect(page).to have_content "Document updated!"
    expect(page).to have_content "Invoice"
    expect(page).to have_content "When completed: Accepted"
    expect(page).to have_content "Description: A list of items for purchase"
  end

  scenario 'user successfully edits a document without a description' do
    sign_in(admin1)
    visit '/documents'

    click_on document1.document_name

    click_on "Update Document"

    fill_in "Document Name", with: "Invoice"
    fill_in "Description", with: ""
    fill_in "Completion Title", with: "Accepted"
    click_on "Submit Document"

    expect(page).to have_content "Document updated!"
    expect(page).to have_content "Invoice"
    expect(page).to_not have_content document1.description
    expect(page).to have_content "When completed: Accepted"
  end

  scenario 'user tries to edit a document without a name' do
    sign_in(admin1)
    visit '/documents'

    click_on document1.document_name

    click_on "Update Document"

    fill_in "Document Name", with: ""
    fill_in "Description", with: "A list of items for purchase"
    fill_in "Completion Title", with: "Accepted"
    click_on "Submit Document"

    expect(page).to have_content "Document name can't be blank"
    expect(page).to_not have_content "Document updated!"
    expect(page).to_not have_content "When completed: Accepted"
    expect(page).to_not have_content "Description: A list of items for purchaser"
  end

  xscenario 'user tries to edit a document without a completion title' do
    sign_in(admin1)
    visit '/documents'

    click_on document1.document_name

    click_on "Update Document"

    fill_in "Document Name", with: "Invoice"
    fill_in "Description", with: "A list of items for purchase"
    fill_in "Completion Title", with: ""
    click_on "Submit Document"

    expect(page).to have_content "Completion status can't be blank"
    expect(page).to_not have_content "Document updated!"
    expect(page).to_not have_content "Description: A list of items for purchase"
  end

  xscenario 'user tries to edit a document without any fields' do
    sign_in(admin1)
    visit '/documents'

    click_on document1.document_name

    click_on "Update Document"

    fill_in "Document Name", with: ""
    fill_in "Description", with: ""
    fill_in "Completion Title", with: ""
    click_on "Submit Document"

    expect(page).to have_content "Completion status can't be blank"
    expect(page).to have_content "Document name can't be blank"
    expect(page).to_not have_content "Document updated!"
  end

  scenario 'user tries to edit a document without making changes' do
    sign_in(admin1)
    visit '/documents'

    click_on document1.document_name

    click_on "Update Document"

    click_on "Submit Document"

    expect(page).to have_content "Document updated!"
    expect(page).to have_content document1.document_name
    expect(page).to have_content document1.description
    expect(page).to have_content document1.completion_status
  end
end
