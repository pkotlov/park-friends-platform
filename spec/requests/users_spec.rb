require 'spec_helper'

describe "Users" do
  describe "GET /users" do
    let(:user) { FactoryGirl.create(:user) }
    it "The User should exist after creation" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get users_path
      response.status.should be(200)
    end
  end
end
