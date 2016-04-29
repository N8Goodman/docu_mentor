require 'rails_helper'

feature "user works on an app" do
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

  scenario "user sees list of started apps" do
    sign_in(user1)

    select procedure1.procedure_name, from: "Procedure"
    click_on "Start Application"

    visit root_path

    expect(page).to have_content "Your Applications:"
    expect(page).to have_content procedure1.procedure_name
  end

  scenario "user is able to navigate to app page" do
    sign_in(user1)

    select procedure1.procedure_name, from: "Procedure"
    click_on "Start Application"

    visit root_path

    click_on procedure1.procedure_name
    expect(page).to have_content procedure1.procedure_name
    expect(page).to have_content "For: #{user1.user_name}"
  end

  xscenario "user is able to upload a file" do
    sign_in(user1)

    select procedure1.procedure_name, from: "Procedure"
    click_on "Start Application"

    attach_file "#{document1.document_name}", "#{Rails.root}/spec/support/images/photo.png"

    click_on("Upload #{document1.document_name}")

    expect(page).to have_content document1.completion_status
  end

  xscenario "user is unable to move to the next stage until all uploads are submitted" do
    sign_in(user1)

    select procedure1.procedure_name, from: "Procedure"
    click_on "Start Application"

    check "Ready for Review?"
    click_on "Submit Step for Review"

    expect(page).to have_content "You must upload all files "
    end

  scenario "user is able to move to the next stage" do
    sign_in(user1)

    select procedure1.procedure_name, from: "Procedure"
    click_on "Start Application"

    check "Ready for Review?"
    click_on "Submit Step for Review"

    expect(page).to have_content stage1.completion_status
  end

  scenario "when a user finishes all stages, the app will display the completion status" do
    sign_in(user1)

    select procedure1.procedure_name, from: "Procedure"
    click_on "Start Application"

    check "Ready for Review?"
    click_on "Submit Step for Review"

    check "Ready for Review?"
    click_on "Submit Step for Review"

    expect(page).to have_content stage1.completion_status
    expect(page).to have_content stage2.completion_status
    expect(page).to have_content procedure1.completion_status
  end

end
