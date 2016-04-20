require 'rails_helper'

RSpec.describe Stage, type: :model do
  let!(:procedure) { FactoryGirl.create(:procedure) }
  let!(:stage) { FactoryGirl.create(:stage) }
  let!(:document) { FactoryGirl.create(:document) }
  let!(:level) { Level.create(stage: stage, procedure: procedure, order: 1) }
  let!(:material) { Material.create(stage: stage, document: document) }

  describe ".new" do
    it "should be an Stage object" do
      expect(stage).to be_a(Stage)
    end

    it "should have a name" do
      expect(stage.stage_name).to be_a(String)
    end

    it "should have a completion_status" do
      expect(stage.completion_status).to be_a(String)
    end

    it "should have procedures" do
      expect(stage.procedures.first).to be_a(Procedure)
    end

    it "should have documents" do
      expect(stage.documents.first).to be_a(Document)
    end
  end
end
