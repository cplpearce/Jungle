require 'rails_helper'

RSpec.describe User, type: :model do
  describe "Validate new users" do
    # Init a new user each time
    before(:each) do
      @demo_user = User.new(first_name: "Tee", last_name: "Ester", email: "tester@tes.ter", password: "12345678", password_confirmation: "12345678")
      @demo_user.save
      @user = User.new(first_name: "Tee", last_name: "Ester", email: "tester@test.er", password: "password", password_confirmation: "password")
    end

    it 'will not create a new user without confirming their password' do
      # Introduced in app/models/user.rb @ password_and_confirmation_same @ ln 15
      @user.password_confirmation = nil
      expect(@user).to_not be_valid
    end

    it 'should not create a user with a non-unique email' do
      # Use our demo_user's email as the new user's email
      @user.email = @demo_user.email
      expect(@user).to_not be_valid
    end

    it 'should always require a first_name, last_name, and email' do
      # Skip the first name and it should fail
      @user.first_name = nil
      expect(@user).to_not be_valid
    end

    it 'should require a password greater than 8 characters' do
      # Short password, not valid
      @user.password = '1234567'
      @user.password_confirmation = '1234567'
      expect(@user).to_not be_valid
    end
  end

  describe 'Validate user login' do

    before(:each) do
      @valid_user = User.new(first_name: "Tee", last_name: "Ester", email: "tester@tes.ter", password: "12345678", password_confirmation: "12345678")
      @valid_user.save
    end

    it 'should login with correct credentials' do
      @logged_in_demo_user = User.authenticate_with_credentials(@valid_user.email, @valid_user.password)
      # After logging in, the returned user should share the same email as the valid user
      expect(@logged_in_demo_user.email).to eq(@valid_user.email)
    end

    it 'should account for user spacing discrepencies "tester@tes.ter ==  "  tester@tes.ter   "' do
      # Account for spaces
      @logged_in_demo_user = User.authenticate_with_credentials("   #{@valid_user.email}  ", @valid_user.password)
      expect(@logged_in_demo_user.email).to eq(@valid_user.email)
    end

    it 'should account for case discrepencies "tester@tes.ter ==  "TesTer@tes.Ter"' do
      # Account for spaces
      @logged_in_demo_user = User.authenticate_with_credentials("TesTer@tes.Ter", @valid_user.password)
      expect(@logged_in_demo_user.email).to eq(@valid_user.email)
    end
  end
end
