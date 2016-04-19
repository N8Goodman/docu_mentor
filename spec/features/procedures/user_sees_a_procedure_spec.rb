require 'rails_helper'

feature "user sees a procedure's information" do
  let!(:procedure1) { FactoryGirl.create(:procedure) }
  let!(:procedure2) { FactoryGirl.create(:procedure) }
  let!(:procedure3) { FactoryGirl.create(:procedure) }
  let!(:admin1) { FactoryGirl.create(:user, admin: true) }

  scenario 'view a procedure show page' do
    sign_in(admin1)
    visit '/procedures'

    click_on procedure1.procedure_name

    expect(page).to have_content procedure1.procedure_name
    expect(page).to have_content procedure1.description
    expect(page).to have_content "When completed: #{procedure1.completion_status}"
  end
end
