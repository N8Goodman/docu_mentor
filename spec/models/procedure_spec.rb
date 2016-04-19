require 'rails_helper'

RSpec.describe Procedure, type: :model do
  let!(:procedure) { FactoryGirl.create(:procedure) }
  let!(:stage) { FactoryGirl.create(:stage) }
  let!(:level) { Level.create(stage: stage, procedure: procedure) }

  describe ".new" do
    it "should be an Procedure object" do
      expect(procedure).to be_a(Procedure)
    end

    it "should have a name" do
      expect(procedure.procedure_name).to be_a(String)
    end

    it "should have a completion_status" do
      expect(procedure.completion_status).to be_a(String)
    end

    it "should have stages" do
      expect(procedure.stages.first).to be_a(Stage)
    end
  end
end
