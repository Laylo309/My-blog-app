require 'rails_helper'

RSpec.describe 'the signin process', type: :feature do
  context 'when successfull' do
    before :each do
      @user = User.new(name: 'Nelsino', bio: "I'm the last oracle", posts_counter: 0, email: 'user@example.com')
      @user.password = 'admin123'
      @user.password_confirmation = 'admin123'
      @user.save
    end

    before do
      visit new_user_registration_path
      within('form') do
        fill_in 'Email', with: 'user@example.com'
        fill_in 'Name', with: 'juan'
        fill_in 'Password', with: 'admin123'
        fill_in 'Password confirmation', with: 'admin123'
        select 'User', from: 'user[role]'
      end
      click_button 'commit'
      click_button 'logout'
    end

    it 'Log in => Signed in successfully.' do
      visit root_path
      puts User.all
      within('form') do
        fill_in 'user_email', with: 'user@example.com'
        fill_in 'user_password', with: 'admin123'
      end
      click_button 'Log in'
      # expect(page).to have_content 'Welcome to your Blog App'
      # expect(page).to have_content 'Signed in successfully.'
      expect(page).to have_content 'Nelsino'
    end

  #   it 'redirects to root' do
  #     visit new_user_session_path
  #     within('form') do
  #       fill_in 'user_email', with: 'user@example.com'
  #       fill_in 'user_password', with: 'admin123'
  #     end

  #     click_button 'Log in'
  #     expect(current_path).to eq(root_path)
  #   end
  # end

  # describe 'when unsuccesfull' do
  #   before :each do
  #     user = User.new(name: 'Nelsino', bio: "I'm the last oracle", posts_counter: 0, email: 'user@example.com')
  #     user.password = 'admin123'
  #     user.password_confirmation = 'admin123'
  #     user.save
  #   end

  #   it 'when email and passoword are not found' do
  #     visit '/users/sign_in'
  #     within('form') do
  #       fill_in 'user_email', with: ''
  #       fill_in 'user_password', with: ''
  #     end
  #     click_button 'Log in'

  #     expect(page).to have_content 'Invalid Email or password.'
  #   end

  #   it 'when email and passoword are not found' do
  #     visit '/users/sign_in'
  #     within('form') do
  #       fill_in 'user_email', with: 'fooooo1@foo.com'
  #       fill_in 'user_password', with: 'admin123'
  #     end
  #     click_button 'Log in'

  #     expect(page).to have_content 'Invalid Email or password.'
  #   end

  #   it 'when email and passoword are not found' do
  #     visit '/users/sign_in'
  #     within('form') do
  #       fill_in 'user_email', with: 'user@example.com'
  #       fill_in 'user_password', with: 'thisisnotthepassword'
  #     end
  #     click_button 'Log in'

  #     expect(page).to have_content 'Invalid Email or password.'
  #   end
  end
end