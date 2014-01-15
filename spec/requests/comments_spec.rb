require 'spec_helper'

describe 'Comments' do

  it 'user can create new comment', js: true do
    visit new_user_registration_path
    fill_in 'Name',                  with: 'User'
    fill_in 'Email',                 with: 'test_user@example.com'
    fill_in 'Password',              with: 'pass12345'
    fill_in 'Password confirmation', with: 'pass12345'
    click_button 'Sign up'
    visit new_hotel_path
    fill_in 'Title', with: 'Test hotel'
    select 'United States', from: 'Country'
    fill_in 'City', with: 'Washington'
    click_on 'Save'
    hotel = Hotel.find_by_title('Test hotel')
    visit new_hotel_comment_path(hotel)
    fill_in 'Comment', with: 'Test comment'
    click_on 'Save'
    expect(current_path).to eq(hotel_path(hotel))
    expect(page).to have_selector('.comment-body') 
    expect(page).to have_content('Test comment')
  end

end