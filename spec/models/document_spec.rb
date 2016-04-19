require 'rails_helper'

RSpec.describe Document, type: :model do
  let!(:document) { FactoryGirl.create(:document) }
  let!(:stage) { FactoryGirl.create(:stage) }
  let!(:material) { Material.create(stage: stage, document: document) }

  describe ".new" do
    it "should be a Document object" do
      expect(document).to be_a(Document)
    end

    it "should have a name" do
      expect(document.document_name).to be_a(String)
    end

    it "should have a completion_status" do
      expect(document.completion_status).to be_a(String)
    end

    it "should have stages" do
      expect(document.stages.first).to be_a(Stage)
    end
  end
end
