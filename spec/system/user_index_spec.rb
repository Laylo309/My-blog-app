require 'rails_helper'

require './spec/mocks_module'

RSpec.describe 'the user index page', type: :feature do
  include Mocks
  context 'It should show the name of all users' do
    before :each do
      users = create_users
      
      visit new_user_session_path

      within('form') do
        fill_in 'Email', with: 'jgonzalez.wj@gmail.com'
        fill_in 'Password', with: '123456'
      end
      click_button 'Log in'
    end

    it 'Should list all users' do
      users = User.all

      users.each do |user|
        expect(page).to have_content user.name
        
      end
      expect(page).to have_content 'juanito'
    end
  end
end