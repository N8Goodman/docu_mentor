require 'rails_helper'

feature "user sees a stage's information" do
  let!(:stage1) { FactoryGirl.create(:stage) }
  let!(:procedure1) { FactoryGirl.create(:procedure) }
  let!(:procedure2) { FactoryGirl.create(:procedure) }
  let!(:level1) { Level.create(procedure: procedure1, stage: stage1) }
  let!(:level2) { Level.create(procedure: procedure2, stage: stage1) }

  scenario 'view a stage show page' do
    visit '/stages'

    click_on stage1.stage_name
    expect(page).to have_content stage1.stage_name
    expect(page).to have_content stage1.description
    expect(page).to have_content "When completed: #{stage1.completion_status}"
  end

  scenario 'sees list of procedures that stage is used in' do
    visit '/stages'

    click_on stage1.stage_name
    expect(page).to have_content procedure1.procedure_name
    expect(page).to have_content procedure2.procedure_name
  end
end
