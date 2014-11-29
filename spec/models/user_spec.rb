require 'spec_helper'

describe User do

  before do
    @user = User.new(name: "Example User", email: "user@example.com",
                     password: "foobar", facebook_id: "12345")
  end

  subject { @user }

  it { should respond_to(:name) }
  it { should respond_to(:email) }

  it { should be_valid }
  
  describe "when facebookid is present" do
    before{@user.password = ""}
    it "set passwort" do
      @user.facebook_id_to_password()
      @user.password.should_not eq("")
    end
  end
end
