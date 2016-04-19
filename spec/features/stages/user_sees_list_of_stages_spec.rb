require 'rails_helper'

feature 'user sees a list of stages' do
  let!(:stage1) { FactoryGirl.create(:stage) }
  let!(:stage2) { FactoryGirl.create(:stage) }
  let!(:stage3) { FactoryGirl.create(:stage) }
  let!(:admin1) { FactoryGirl.create(:user, admin: true) }

  scenario 'see a list of stages' do
    sign_in(admin1)
    visit '/stages'

    expect(page).to have_content stage1.stage_name
    expect(page).to have_content stage2.stage_name
    expect(page).to have_content stage3.stage_name

  end
end
