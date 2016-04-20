require 'rails_helper'

feature "user navigates between procedures, stages, and documents" do
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
  let!(:material5) { Material.create(stage: stage2, document: document1) }
  let!(:level2) { Level.create(procedure: procedure1, stage: stage2, order: 1) }
  let!(:level1) { Level.create(procedure: procedure1, stage: stage1, order: 2) }
  let!(:admin1) { FactoryGirl.create(:user, admin: true) }

  scenario "on a procedure's show page, there are links to each stage's show page" do
    sign_in(admin1)
    visit '/procedures'

    click_on procedure1.procedure_name

    expect(page).to have_link stage1.stage_name
    expect(page).to have_link stage2.stage_name
  end

  scenario "on a procedure's show page, the user can click on the stage's names to view the stage's show page" do
    sign_in(admin1)
    visit '/procedures'

    click_on procedure1.procedure_name

    click_on stage1.stage_name

    expect(page).to have_content stage1.stage_name
    expect(page).to have_content stage1.description
    expect(page).to have_content stage1.completion_status
  end

  scenario "on a stage's show page, there are links to each document's show page" do
    sign_in(admin1)
    visit '/stages'

    click_on stage1.stage_name

    expect(page).to have_link document1.document_name
    expect(page).to have_link document2.document_name
  end

  scenario "on a stage's show page, the user can click on the document's names to view the document's show page" do
    sign_in(admin1)
    visit '/stages'

    click_on stage1.stage_name

    click_on document1.document_name

    expect(page).to have_content document1.document_name
    expect(page).to have_content document1.description
    expect(page).to have_content document1.completion_status
  end

  scenario "on a stage's show page, there are links to the procedures it is contained in" do
    sign_in(admin1)
    visit '/stages'

    click_on stage1.stage_name

    expect(page).to have_link procedure1.procedure_name
  end

  scenario "on a stage's show page, the user can click on the procedure's names to view the procedure's show page" do
    sign_in(admin1)
    visit '/stages'

    click_on stage1.stage_name

    click_on procedure1.procedure_name

    expect(page).to have_content procedure1.procedure_name
    expect(page).to have_content procedure1.description
    expect(page).to have_content procedure1.completion_status
  end

  scenario "on a document's show page, there are links to the stages it is contained in" do
    sign_in(admin1)
    visit '/documents'

    click_on document1.document_name

    expect(page).to have_link stage1.stage_name
    expect(page).to have_link stage2.stage_name
  end

  scenario "on a document's show page, the user can click on the stage's names to view the stage's show page" do
    sign_in(admin1)
    visit '/documents'

    click_on document1.document_name

    click_on stage1.stage_name

    expect(page).to have_content stage1.stage_name
    expect(page).to have_content stage1.description
    expect(page).to have_content stage1.completion_status
  end
end
