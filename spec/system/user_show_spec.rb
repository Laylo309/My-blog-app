require 'rails_helper'

RSpec.describe 'the user index page', type: :feature do

  context 'displaying user show page correctly' do
    it 'can see user picture' do
      users = User.all

      users.each do |user|
        visit user_path(user.id)
        img = page.find('img')
        expect(img['src']).to include(user.name)
        visit root_path
      end
    end

    it 'Should list user`s name' do
      users = User.all

      users.each do |user|
        visit user_path(user.id)
        expect(page).to have_content user.name
        visit root_path
      end
    end

    it 'Should list all users post counter' do
      users = User.all

      users.each do |user|
        visit user_path(user.id)
        expect(page).to have_content user.posts_counter
        visit root_path
      end
    end

    it 'Should list all users bio' do
      users = User.all

      users.each do |user|
        visit user_path(user.id)
        expect(page).to have_content user.bio
        visit root_path
      end
    end

    it 'can see user first 3 post' do
      users = User.all

      users.each do |user|
        visit user_path(user.id)
        recent_posts = user.recent_posts
        expect(recent_posts.length).to eq(3)
        visit root_path
      end
    end

    it 'can see user recent_posts' do
      users = User.all

      users.each do |user|
        visit user_path(user.id)
        recent_posts = user.recent_posts
        recent_posts.each do |post|
          expect(page).to have_content post.text.to_s
        end

        visit root_path
      end
    end

    it 'can see button to show all posts' do
      users = User.all

      users.each do |user|
        visit user_path(user.id)
        expect(page).to have_content 'See all posts'
        visit root_path
      end
    end
  end

  context 'is redirect to user post page index' do
    it 'compares user path with current path' do
      users = User.all

      users.each do |user|
        click_link user.name
        recent_posts = user.recent_posts
        recent_posts.each do |post|
          click_link post.name
          expect(current_path).to eq(user_post_path(user.id, post.id))
        end
        visit root_path
      end
    end
  end
end
