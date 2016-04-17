require 'rails_helper'

feature "user deletes a stage " do
  let!(:stage1) { FactoryGirl.create(:stage) }
  let!(:stage2) { FactoryGirl.create(:stage) }
  let!(:stage3) { FactoryGirl.create(:stage) }

  scenario 'user navigates to deletes stage' do
    visit '/stages'

    click_on stage1.stage_name

    click_on "Delete Stage"

    expect(page).to have_content "#{stage1.stage_name} has been deleted!"
    expect(page).to have_content stage2.stage_name
    expect(page).to have_content stage3.stage_name
    expect(page).to_not have_link stage1.stage_name
  end
end
