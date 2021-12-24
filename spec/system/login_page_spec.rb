require 'rails_helper'
require 'user'

RSpec.describe 'the signin process', type: :feature do
    before :each do
      visit new_user_registration_path
      within('form') do
        fill_in 'Email', with: 'jgonzalez.wj@gmail.com'
        fill_in 'Name', with: 'juanito'
        fill_in 'Password', with: '123456'
        fill_in 'Password confirmation', with: '123456'
        select 'User', from: 'user[role]'
      end
      click_button 'commit'
      click_button 'Log Out'
    end
  context 'It should sign in and show root page' do

    it 'redirects to root page with right credentials' do
      visit new_user_session_path
      within('form') do
        fill_in 'Email', with: 'jgonzalez.wj@gmail.com'
        fill_in 'Password', with: '123456'
      end
      click_button 'Log in'
      expect(page).to have_content 'juanito'
    end
  end
end

