require 'spec_helper'

describe 'Authorization' do

  describe 'authenticated user' do
    before do
      user = create(:user)
      login_as(user)
    end

    describe 'after sign in' do

      it 'have right link to new hotel' do
        visit '/'
        click_link ('New hotel')
        expect(current_path).to eq(new_hotel_path)
      end

      it 'have right link to hotels list' do
        visit '/'
        click_link ('Hotels')
        expect(current_path).to eq(hotels_path)
      end

      it 'have right link to edit user' do
        visit '/'
        click_link ('Edit profile')
        expect(current_path).to eq(edit_user_registration_path)
      end

      it 'correct logout' do
        visit '/'
        click_link ('Logout')
        expect(page).to have_content('Signed out successfully')
      end

    end
  end

  describe 'not authenticated user' do

    it 'when attempt to visit hotels should redirect to sign in path' do
      visit hotels_path
      expect(current_path).to eq(new_user_session_path)
    end

  end

end