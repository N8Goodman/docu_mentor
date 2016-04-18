require 'rails_helper'

feature "user sees a stage's documents" do
  let!(:stage1) { FactoryGirl.create(:stage) }
  let!(:stage2) { FactoryGirl.create(:stage) }
  let!(:document1) { FactoryGirl.create(:document) }
  let!(:document2) { FactoryGirl.create(:document) }
  let!(:document3) { FactoryGirl.create(:document) }
  let!(:document4) { FactoryGirl.create(:document) }
  let!(:material1) { Material.create(stage: stage1, document: document1) }
  let!(:material2) { Material.create(stage: stage1, document: document2) }

  scenario "the documentss of a stage are displayed on the show page" do
    visit '/stages'

    click_on stage1.stage_name

    expect(page).to have_content document1.document_name
    expect(page).to have_content document2.document_name
  end

  scenario "multiple documents can be added to a stage" do
    visit '/stages'

    click_on stage1.stage_name

    select document3.document_name, from: "Document"
    click_on "Add Document"

    expect(page).to have_content document1.document_name
    expect(page).to have_content document2.document_name
    expect(page).to have_content document3.document_name
    expect(page).to have_content "Document Added"
  end

  scenario "a document cannot be added to a stage more than once" do
    visit '/stages'

    click_on stage1.stage_name

    select document2.document_name, from: "Document"
    click_on "Add Document"

    expect(page).to have_content "Stage already contains document!"
  end
end
