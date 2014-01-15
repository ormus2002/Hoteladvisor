require 'spec_helper'

describe 'Hotels' do

  before do
    user = create(:user)
    login_as(user)
  end

  let(:hotel) { create(:hotel) }

  it 'user can view all hotels' do
    created_hotels = create_list(:hotel, 10)
    visit hotels_path
    expect(page).to have_selector('.hotel', count: Hotel.all.count)
  end

  it 'user can create new hotel' do
    visit new_hotel_path
    fill_in 'Title', with: 'New hotel'
    select 'United States', from: 'Country'
    fill_in 'City', with: 'Washington'
    click_on 'Save'
    expect(current_path).to eq(hotel_path(Hotel.find_by_title('New hotel')))
    expect(page).to have_content('Hotel was successfully saved')
  end

  it 'have right link for new comment' do
    visit hotel_path(hotel)
    click_link ('New comment')
    expect(current_path).to eq(new_hotel_comment_path(hotel))
  end

end