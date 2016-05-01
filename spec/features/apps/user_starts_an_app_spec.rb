require 'rails_helper'

feature "user starts an app" do
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
  let!(:user1) { FactoryGirl.create(:user) }

  scenario "user sees list of apps" do
    sign_in(user1)

    expect(page).to have_content "Applications:"
  end

  scenario "when user starts an application a new app is generated with the corresponding procedure info" do
    sign_in(user1)

    select procedure1.procedure_name, from: "Procedure"
    click_on "Start Application"

    expect(page).to have_content procedure1.procedure_name
    expect(page).to have_content "For: #{user1.user_name}"
    expect(page).to have_content stage1.stage_name
    expect(page).to have_content stage2.stage_name
    expect(page).to have_content document1.document_name
    expect(page).to have_content document2.document_name
    expect(page).to have_content document3.document_name
    expect(page).to have_content document4.document_name
  end

  scenario "user starts an application and can see application on home page" do
    sign_in(user1)

    select procedure1.procedure_name, from: "Procedure"
    click_on "Start Application"

    visit root_path

    expect(page).to have_content procedure1.procedure_name
  end
end
