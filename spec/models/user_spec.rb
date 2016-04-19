require 'rails_helper'

RSpec.describe User, type: :model do
  let!(:user) { FactoryGirl.create(:user) }

  describe ".new" do
    it "should be an User object" do
      expect(user).to be_a(User)
    end

    it "should have a name" do
      expect(user.user_name).to be_a(String)
    end
  end
end
