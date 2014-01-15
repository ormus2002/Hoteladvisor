require 'spec_helper'

describe Address do

  let(:hotel) { FactoryGirl.create(:hotel) }
  let(:address) { FactoryGirl.create(:address, hotel: hotel) }

  subject { address }

  it { should respond_to(:country) }
  it { should respond_to(:state) }
  it { should respond_to(:city) }
  it { should respond_to(:street) }

  it { should be_valid }

end