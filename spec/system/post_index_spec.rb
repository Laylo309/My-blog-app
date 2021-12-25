require 'rails_helper'
require './spec/mocks_module'

RSpec.describe 'the user post index page', type: :feature do
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
