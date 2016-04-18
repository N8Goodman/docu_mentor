feature "user can successfully navigates using the nav bar" do

  scenario "user views procedures index from root" do
    visit root_path

    click_on "Procedures"

    expect(page.current_path).to eq procedures_path
  end

  scenario "user views procedures index from stages" do
    visit stages_path

    click_on "Procedures"

    expect(page.current_path).to eq procedures_path
  end

  scenario "user views procedures index from documents" do
    visit documents_path

    click_on "Procedures"

    expect(page.current_path).to eq procedures_path
  end

  scenario "user views stages index from root" do
    visit root_path

    click_on "Stages"

    expect(page.current_path).to eq stages_path
  end

  scenario "user views stages index from procedures" do
    visit procedures_path

    click_on "Stages"

    expect(page.current_path).to eq stages_path
  end

  scenario "user views stages index from documents" do
    visit documents_path

    click_on "Stages"

    expect(page.current_path).to eq stages_path
  end

  scenario "user views documents index from root" do
    visit root_path

    click_on "Documents"

    expect(page.current_path).to eq documents_path
  end

  scenario "user views documents index from procedures" do
    visit procedures_path

    click_on "Documents"

    expect(page.current_path).to eq documents_path
  end

  scenario "user views documents index from stages" do
    visit stages_path

    click_on "Documents"

    expect(page.current_path).to eq documents_path
  end
  scenario "user views root path from documents" do
    visit documents_path

    click_on "Home"

    expect(page.current_path).to eq root_path
  end

  scenario "user views root path from procedures" do
    visit procedures_path

    click_on "Home"

    expect(page.current_path).to eq root_path
  end

  scenario "user views root path from stages" do
    visit stages_path

    click_on "Home"

    expect(page.current_path).to eq root_path
  end
end
