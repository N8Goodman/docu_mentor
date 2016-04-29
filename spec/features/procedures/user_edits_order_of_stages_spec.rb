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

  xscenario "the order rank of a stage is displayed next to it's name" do
    sign_in(admin1)
    visit '/procedures'

    click_on procedure1.procedure_name

    expect(page).to have_content stage1.stage_name
    expect(page).to have_content "Order: 1 #{stage1.stage_name}"
    expect(page).to have_content stage2.stage_name
    expect(page).to have_content "Order: 2 #{stage2.stage_name}"

  end

  xscenario "user can re-order the stages of a procedure" do
    sign_in(admin1)
    visit '/procedures'

    click_on procedure1.procedure_name

    first('.stage-box').click_on('-1')

    expect(page).to have_content "Order: 2 #{stage1.stage_name}"
    expect(page).to have_content "Order: 1 #{stage2.stage_name}"
  end

  xscenario "user cannot move the first stage up" do
    sign_in(admin1)
    visit '/procedures'

    click_on procedure1.procedure_name

    first('.stage-box').click_on('+1')

    expect(page).to_not have_content "Order: 0 #{stage1.stage_name}"
    expect(page).to have_content "This is already the first stage!"
  end

  xscenario "user cannot move the last stage down" do
    sign_in(admin1)
    visit '/procedures'

    click_on procedure1.procedure_name

    find(".stage-list div.stage-box:nth-child(2) #down").click

    expect(page).to_not have_content "Order: 3 #{stage2.stage_name}"
    expect(page).to have_content "This is already the last stage!"
  end
end
