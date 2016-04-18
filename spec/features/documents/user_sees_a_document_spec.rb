require 'rails_helper'

feature "user sees a document's information" do
  let!(:stage1) { FactoryGirl.create(:stage) }
  let!(:stage2) { FactoryGirl.create(:stage) }
  let!(:document1) { FactoryGirl.create(:document) }
  let!(:material1) { Material.create(stage: stage1, document: document1) }
  let!(:material2) { Material.create(stage: stage2, document: document1) }


  scenario 'view a document show page' do
    visit '/documents'

    click_on document1.document_name
    expect(page).to have_content document1.document_name
    expect(page).to have_content document1.description
    expect(page).to have_content "When completed: #{document1.completion_status}"
  end

  scenario 'sees list of stages that document is used in' do
    visit '/documents'

    click_on document1.document_name
    expect(page).to have_content stage1.stage_name
    expect(page).to have_content stage2.stage_name
  end
end
