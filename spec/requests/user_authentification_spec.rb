require "spec_helper"

describe 'user' do

  let(:user_attr) { attributes_for(:user) }

  it 'can sign up' do
    visit new_user_registration_path
    fill_in 'Name',                  with: 'User 1'
    fill_in 'Email',                 with: 'test@example.com'
    fill_in 'Password',              with: 'pass12345'
    fill_in 'Password confirmation', with: 'pass12345'
    click_button 'Sign up'
    expect(page).to have_content('Welcome! You have signed up successfully')
  end

  it 'can sign in' do
    User.create!(user_attr)
    visit new_user_session_path
    fill_in 'Email',    with: 'person1@example.com'
    fill_in 'Password', with: 'password'
    click_button 'Sign in'
    expect(page).to have_content('Signed in successfully')
  end

end