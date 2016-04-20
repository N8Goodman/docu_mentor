require 'rails_helper'

RSpec.describe Level, type: :model do
  let!(:procedure) { FactoryGirl.create(:procedure) }
  let!(:stage) { FactoryGirl.create(:stage) }
  let!(:level) { Level.create(stage: stage, procedure: procedure, order: 1) }

  describe ".new" do
    it "should be an Level object" do
      expect(level).to be_a(Level)
    end

    it "should have a procedure" do
      expect(level.procedure).to be_a(Procedure)
    end

    it "should have a stage" do
      expect(level.stage).to be_a(Stage)
    end
  end
end
