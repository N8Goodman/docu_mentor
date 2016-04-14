require 'rails_helper'

feature 'user sees a list of procedures' do
  let!(:procedure1) { FactoryGirl.create(:procedure) }
  let!(:procedure2) { FactoryGirl.create(:procedure) }
  let!(:procedure3) { FactoryGirl.create(:procedure) }

  scenario 'see a list of procedures' do
    visit 'procedures'

    expect(page).to have_content procedure1.name
    expect(page).to have_content procedure2.name
    expect(page).to have_content procedure3.name

  end
end
