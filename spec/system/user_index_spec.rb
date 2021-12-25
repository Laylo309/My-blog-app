require 'rails_helper'

RSpec.describe 'the user index page', type: :feature do
  context 'It should show the name of all users' do
    it 'Should list all users' do
      users = User.all

      users.each do |user|
        expect(page).to have_content user.name
      end
    end

    it 'can see all users photos' do
      users = User.all.order(:id)
      imgs = page.all('img')

      users.each_with_index do |user, index|
        expect(imgs[index]['src']).to include(user.name)
      end
      expect(imgs.length).to be(users.length)
    end

    it 'Should list all users post counter' do
      users = User.all

      users.each do |user|
        expect(page).to have_content user.posts_counter
      end
    end
  end

  context 'is redirect to user page show' do
    it 'compares user path with current path' do
      users = User.all

      users.each do |user|
        visit root_path
        click_link user.name
        expect(current_path).to eq(user_path(user.id))
        visit root_path
      end
    end
  end
end
