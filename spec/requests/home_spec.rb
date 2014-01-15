require 'spec_helper'

describe 'Home page' do

  it 'have only 5 hotels' do
    created_hotels = create_list(:hotel, 10)
    visit '/'
    expect(page).to have_selector('.hotel', count: 5)
  end

  it 'have right link to sign up' do
    visit '/'
    click_link ('Sign up')
    expect(current_path).to eq(new_user_registration_path)
  end

  it 'have right link to sign in' do
    visit '/'
    click_link ('Login')
    expect(current_path).to eq(new_user_session_path)
  end

end
