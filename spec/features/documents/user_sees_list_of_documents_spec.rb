require 'rails_helper'

feature 'user sees a list of documents' do
  let!(:document1) { FactoryGirl.create(:document) }
  let!(:document2) { FactoryGirl.create(:document) }
  let!(:document3) { FactoryGirl.create(:document) }

  scenario 'see a list of documents' do
    visit '/documents'

    expect(page).to have_content document1.document_name
    expect(page).to have_content document2.document_name
    expect(page).to have_content document3.document_name

  end
end
