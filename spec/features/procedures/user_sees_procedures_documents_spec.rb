require 'rails_helper'

feature "user sees a procedure's stages and documents" do
  let!(:procedure1) { FactoryGirl.create(:procedure) }
  let!(:stage1) { FactoryGirl.create(:stage) }
  let!(:stage2) { FactoryGirl.create(:stage) }
  let!(:document1) { FactoryGirl.create(:document) }
  let!(:document2) { FactoryGirl.create(:document) }
  let!(:document3) { FactoryGirl.create(:document) }
  let!(:document4) { FactoryGirl.create(:document) }
  let!(:material1) { Material.create(stage: stage1, document: document1) }
  let!(:material2) { Material.create(stage: stage1, document: document2) }
  let!(:material3) { Material.create(stage: stage2, document: document3) }
  let!(:material4) { Material.create(stage: stage2, document: document4) }
  let!(:level2) { Level.create(procedure: procedure1, stage: stage2) }

  scenario "the stages of a procedure are displayed on the show page" do
    visit '/procedures'

    click_on procedure1.procedure_name

    expect(page).to have_content stage2.stage_name
  end

  scenario "the documents of each stage of a procedure are displayed on the show page" do
    visit '/procedures'

    click_on procedure1.procedure_name

    expect(page).to have_content document3.document_name
    expect(page).to have_content document4.document_name
  end

  scenario "when a new document is added to a stage, it will appear on any procedures where that stage is included" do
    visit '/stages'

    click_on stage2.stage_name

    select document1.document_name, from: "Document"
    click_on "Add Document"

    click_on "Procedures"
    click_on procedure1.procedure_name

    expect(page).to have_content document1.document_name
  end

  scenario "multiple stages can be added to a procedure" do
    visit '/procedures'

    click_on procedure1.procedure_name

    select stage1.stage_name, from: "Stage"
    click_on "Add Stage"

    expect(page).to have_content stage1.stage_name
    expect(page).to have_content stage2.stage_name
    expect(page).to have_content "Stage Added"
  end

  scenario "when a stage is added, the documents of that stage are also displayed" do
    visit '/procedures'

    click_on procedure1.procedure_name

    select stage1.stage_name, from: "Stage"
    click_on "Add Stage"

    expect(page).to have_content stage1.stage_name
    expect(page).to have_content stage2.stage_name
    expect(page).to have_content document1.document_name
    expect(page).to have_content document2.document_name
    expect(page).to have_content document3.document_name
    expect(page).to have_content document4.document_name
  end
  scenario "a stage cannot be added to a procedure more than once" do
    visit '/procedures'

    click_on procedure1.procedure_name

    select stage2.stage_name, from: "Stage"
    click_on "Add Stage"

    expect(page).to have_content "Procedure already contains stage!"
  end
end
