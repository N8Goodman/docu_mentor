require 'rails_helper'

RSpec.describe Material, type: :model do
  let!(:document) { FactoryGirl.create(:document) }
  let!(:stage) { FactoryGirl.create(:stage) }
  let!(:material) { Material.create(stage: stage, document: document) }

  describe ".new" do
    it "should be an Material object" do
      expect(material).to be_a(Material)
    end

    it "should have a document" do
      expect(material.document).to be_a(Document)
    end

    it "should have a stage" do
      expect(material.stage).to be_a(Stage)
    end
  end
end
