require 'rails_helper'

RSpec.describe 'the signin process', type: :feature do
  context 'It should sign in and show root page' do
    before :each do
      user = User.new(name: 'juanito', bio: "I'm the last oracle", posts_counter: 0, email: 'jgonzalez.wj@gmail.com')
      user.password = '123456'
      user.password_confirmation = '123456'
      user.save
    end

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

