require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryGirl.create(:user)
  end
  describe 'creation' do
    it 'be created' do
      expect(@user).to be_valid
    end
  end

  describe 'validation' do
    it'can not be created without first_name' do
      @user.first_name = nil
      expect(@user).to_not be_valid
    end

    it'can not be created without last_name' do
      @user.last_name = nil
      expect(@user).to_not be_valid
    end

    it'can not be created without phone' do
      @user.phone = nil
      expect(@user).to_not be_valid
    end

    it'requires the phone attr to only contain integers' do
      @user.phone = 'mygreatstr'
      expect(@user).to_not be_valid
    end

    it'requires the phone attr to only have 10 characters' do
      @user.phone = '12345678901'
      expect(@user).to_not be_valid
    end
  end
  describe "custome name methods" do
    it 'has a full name method that combines first and last name'do
      expect(@user.full_name).to eq("SNOW,JON")
    end
  end
end
