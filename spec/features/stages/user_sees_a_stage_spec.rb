require 'rails_helper'

feature "user sees a stage's information" do
  let!(:stage1) { FactoryGirl.create(:stage) }
  let!(:stage2) { FactoryGirl.create(:stage) }
  let!(:stage3) { FactoryGirl.create(:stage) }

  scenario 'view a stage show page' do
    visit '/stages'

    click_on stage1.stage_name
    expect(page).to have_content stage1.stage_name
    expect(page).to have_content stage1.description
  end
end
