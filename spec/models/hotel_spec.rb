require 'spec_helper'

describe Hotel do

  let(:hotel) { FactoryGirl.create(:hotel) }

  subject { hotel }

  it { should respond_to(:title) }
  it { should respond_to(:rating) }
  it { should respond_to(:is_breakfast) }
  it { should respond_to(:room_price) }
  it { should respond_to(:room_description) }

  it { should be_valid }

  describe 'when title is not present' do
    before { hotel.title = " " }
    it { should_not be_valid }
  end

  describe 'when rating is not present' do
    before { hotel.rating = nil }
    it { should_not be_valid }
  end

end