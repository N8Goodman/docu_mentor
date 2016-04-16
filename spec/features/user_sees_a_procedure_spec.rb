require 'rails_helper'

feature "user sees a procedure's information" do
  let!(:procedure1) { FactoryGirl.create(:procedure) }
  let!(:procedure2) { FactoryGirl.create(:procedure) }
  let!(:procedure3) { FactoryGirl.create(:procedure) }

  scenario 'view a procedure show page' do
    visit '/'

    click_on procedure1.name
    expect(page).to have_content procedure1.name
    expect(page).to have_content procedure1.description
  end
end
