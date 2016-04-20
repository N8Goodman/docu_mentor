require 'rails_helper'

RSpec.describe App, type: :model do
  let!(:procedure) { FactoryGirl.create(:procedure) }
  let!(:user) { FactoryGirl.create(:user) }
  let!(:app) { App.create(user: user, procedure: procedure) }

  describe ".new" do
    it "should be an App object" do
      expect(app).to be_an(App)
    end

    it "should have a procedure" do
      expect(app.procedure).to be_a(Procedure)
    end

    it "should have a default active stage of 1" do
      expect(app.active_stage).to eq(1)
    end

    it "should have a user" do
      expect(app.user).to be_a(User)
    end

  end
end
