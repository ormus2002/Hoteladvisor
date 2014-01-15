require 'spec_helper'

describe Comment do

  let(:hotel) { FactoryGirl.create(:hotel) }
  let(:comment) { FactoryGirl.create(:comment, hotel: hotel) }

  subject { comment }

  it { should respond_to(:rating) }
  it { should respond_to(:text) }

  it { should be_valid }

  describe 'when text is not present' do
    before { comment.text = " " }
    it { should_not be_valid }
  end

  describe 'when rating is not present' do
    before { comment.rating = nil }
    it { should_not be_valid }
  end 

  describe 'when rating > 5' do
    before { comment.rating = 6 }
    it { should_not be_valid }
  end 

  describe 'when rating < 1' do
    before { comment.rating = 0 }
    it { should_not be_valid }
  end 

  describe 'hotel.rating' do
    it 'should recalculated' do
      expect(comment.hotel.rating).to eq(4)
    end
  end

end