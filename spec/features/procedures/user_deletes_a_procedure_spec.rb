require 'rails_helper'

feature "user deletes a procedure " do
  let!(:procedure1) { FactoryGirl.create(:procedure) }
  let!(:procedure2) { FactoryGirl.create(:procedure) }
  let!(:procedure3) { FactoryGirl.create(:procedure) }

  scenario 'user navigates to deletes procedure' do
    visit '/procedures'

    click_on procedure1.procedure_name

    click_on "Delete Procedure"

    expect(page).to have_content "#{procedure1.procedure_name} has been deleted!"
    expect(page).to have_content procedure2.procedure_name
    expect(page).to have_content procedure3.procedure_name
    expect(page).to_not have_link procedure1.procedure_name
  end
end
