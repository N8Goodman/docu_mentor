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
  let!(:level1) { Level.create(procedure: procedure1, stage: stage1, order: 1) }
  let!(:level2) { Level.create(procedure: procedure1, stage: stage2, order: 2) }
  let!(:admin1) { FactoryGirl.create(:user, admin: true) }

  scenario "the order rank of a stage is displayed next to it's name" do
    sign_in(admin1)
    visit '/procedures'

    click_on procedure1.procedure_name

    expect(page).to have_content stage1.stage_name
    expect(page).to have_content "Step #1 #{stage1.stage_name}"
    expect(page).to have_content stage2.stage_name
    expect(page).to have_content "Step #2 #{stage2.stage_name}"

  end
end
