require 'rails_helper'
require './spec/mocks_module'

RSpec.describe 'the user post index page', type: :feature do
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
  context 'displaying user post index page correctly' do
    it 'can see user picture' do
      users = User.all

      users.each do |user|
        visit user_posts_path(user.id)
        img = page.find('img')
        expect(img['src']).to include(user.name)
        visit root_path
      end
    end
    it 'Should list user`s name' do
      users = User.all

      users.each do |user|
        visit user_posts_path(user.id)
        expect(page).to have_content user.name
        visit root_path
      end
    end

    it 'Should list all users post counter' do
      users = User.all

      users.each do |user|
        visit user_posts_path(user.id)
        expect(page).to have_content user.posts_counter
        visit root_path
      end
    end

    it 'Should show posts title' do
      users = User.all

      users.each do |user|
        visit user_posts_path(user.id)
        posts = user.posts.all
        posts.each do |post|
          expect(page).to have_content post.title
          visit root_path
        end
      end
    end

    it 'Should show some of the posts body' do
      users = User.all

      users.each do |user|
        visit user_posts_path(user.id)
        posts = user.posts.all
        posts.each do |post|
          expect(page).to have_content post.text
          visit root_path
        end
      end
    end

    it 'can see the first comments on a post' do
      users = User.all

      users.each do |user|
        visit user_posts_path(user.id)
        recent_posts = user.recent_posts
        recent_posts.each do |post|
          recent_comments = post.recent_comments
          recent_comments.each do |comment|
            expect(page).to have_content comment.user.name.to_s
            expect(page).to have_content comment.text.to_s
          end
        end
        visit root_path
      end
    end

    it 'Should show how many comments a post has' do
      users = User.all

      users.each do |user|
        visit user_posts_path(user.id)
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
        visit user_posts_path(user.id)
        recent_posts = user.recent_posts
        recent_posts.each do |post|
          expect(page).to have_content post.likes_counter
        end
        visit root_path
      end
    end

    it 'can see a section for pagination if there are more posts than fit on the view' do
      users = User.all

      users.each do |user|
        visit user_posts_path(user.id)
        expect(page).to have_content 'Pagination'
        visit root_path
      end
    end

    context 'it redirects to that posts show page' do
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
end
