require 'rails_helper'

require './spec/mocks_module'

RSpec.describe 'Post show page', type: :feature do
  include Mocks

  before :each do
    users = create_users
    posts = create_posts(users)
    visit new_user_session_path

    within('form') do
      fill_in 'Email', with: 'jgonzalez.wj@gmail.com'
      fill_in 'Password', with: '123456'
    end
    click_button 'Log in'
  end

  context 'displaying post show page correctly' do
    it 'Should show posts title' do
      users = User.all

      users.each do |user|
        visit user_post_path(user.id)
        posts = user.posts.all
        posts.each do |post|
          expect(page).to have_content post.title
          visit root_path
        end
      end
    end

    it 'can see who wrote the post' do
      users = User.all

      users.each do |user|
        visit user_post_path(user.id)
        expect(page).to have_content user.name
        visit root_path
      end
    end

    it 'Should show how many comments a post has' do
      users = User.all

      users.each do |user|
        visit user_post_path(user.id)
        recent_posts = user.recent_posts
        recent_posts.each do |post|
          expect(page).to have_content post.comments_counter
        end
        visit root_path
      end
    end

    it 'Should show how many likes a post has' do
      users = User.all

      users.each do |user|
        visit user_post_path(user.id)
        recent_posts = user.recent_posts
        recent_posts.each do |post|
          expect(page).to have_content post.likes_counter
        end
        visit root_path
      end
    end

    it 'Should show the posts body' do
      users = User.all

      users.each do |user|
        visit user_post_path(user.id)
        posts = user.posts.all
        posts.each do |post|
          expect(page).to have_content post.text
          visit root_path
        end
      end
    end

    it 'can see the username of each commentor' do
      users = User.all

      users.each do |user|
        visit user_post_path(user.id)
        recent_posts = user.recent_posts
        recent_posts.each do |post|
          recent_comments = post.recent_comments
          recent_comments.each do |comment|
            expect(page).to have_content comment.user.name.to_s
          end
        end
        visit root_path
      end
    end

    it 'can see the comment each commentor left' do
      users = User.all

      users.each do |user|
        visit user_post_path(user.id)
        recent_posts = user.recent_posts
        recent_posts.each do |post|
          recent_comments = post.recent_comments
          recent_comments.each do |comment|
            expect(page).to have_content comment.text.to_s
          end
        end
        visit root_path
      end
    end
  end
end
