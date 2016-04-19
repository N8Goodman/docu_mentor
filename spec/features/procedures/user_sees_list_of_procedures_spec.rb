require 'rails_helper'

feature 'user sees a list of procedures' do
  let!(:procedure1) { FactoryGirl.create(:procedure) }
  let!(:procedure2) { FactoryGirl.create(:procedure) }
  let!(:procedure3) { FactoryGirl.create(:procedure) }
  let!(:admin1) { FactoryGirl.create(:user, admin: true) }

  scenario 'see a list of procedures' do
    sign_in(admin1)
    visit 'procedures'

    expect(page).to have_content procedure1.procedure_name
    expect(page).to have_content procedure2.procedure_name
    expect(page).to have_content procedure3.procedure_name

  end
end
