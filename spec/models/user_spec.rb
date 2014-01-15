require 'spec_helper'

describe User do

  before do
    @user_attr = FactoryGirl.attributes_for(:user)
    @user = User.new(@user_attr)
  end

  subject { @user }

  it { should respond_to(:name) }

  it { should be_valid }

  describe 'when name is not present' do
    before { @user.name = " " }
    it { should_not be_valid }
  end

  describe 'when name is too long' do
    before { @user.name = "a" * 100 }
    it { should_not be_valid }
  end

end