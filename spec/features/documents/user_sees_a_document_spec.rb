require 'rails_helper'

feature "user sees a document's information" do
  let!(:document1) { FactoryGirl.create(:document) }
  let!(:document2) { FactoryGirl.create(:document) }
  let!(:document3) { FactoryGirl.create(:document) }

  scenario 'view a document show page' do
    visit '/documents'

    click_on document1.document_name
    expect(page).to have_content document1.document_name
    expect(page).to have_content document1.description
    expect(page).to have_content "When completed: #{document1.completion_status}"
  end
end
