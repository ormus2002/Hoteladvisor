require 'spec_helper'

describe 'Image upload' do

  xit 'user can upload image', js: true do
    visit new_user_registration_path
    fill_in 'Name',                  with: 'User image upload'
    fill_in 'Email',                 with: 'test_image@example.com'
    fill_in 'Password',              with: 'pass12345'
    fill_in 'Password confirmation', with: 'pass12345'
    click_button 'Sign up'
    visit new_hotel_path
    fill_in 'Title', with: 'Hotel with foto'
    select 'United States', from: 'Country'
    fill_in 'City', with: 'Washington'
    click_on 'Save'
    hotel = Hotel.find_by_title('Hotel with foto')
    visit hotel_path(hotel)

    #page.driver.browser.execute_script "$('input[type=file]').show();"
    page.execute_script(%Q{$("input[type=file]").css("opacity", "1").css("-moz-transform", "none");})

    attach_file 'image_image_file', './spec/image/test.png'
    sleep 10
    page.execute_script("$('form#new_image').submit()")
    expect(hotel.images.count).to eq(1)
    expect(page).to have_selector('.lb_image img')
  end

end