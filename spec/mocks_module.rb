require 'user'

module Mocks
  def create_users
    names = [
      { name: 'juanito', bio: "I'm the last oracle", posts_counter: 0, email: 'jgonzalez.wj@gmail.com', role: 'admin' },
      { name: 'Nelsino', bio: "I'm the First oracle", posts_counter: 0, email: 'test1@foo.com', role: 'admin' },
      { name: 'Laylo', bio: "I'm the Best oracle", posts_counter: 0, email: 'test2@foo.com', role: 'admin' }
    ]

    (0..2).each do |i|
      visit new_user_registration_path
      within('form') do
        fill_in 'Email', with: names[i][:email]
        fill_in 'Name', with: names[i][:name]
        fill_in 'Password', with: '123456'
        fill_in 'Password confirmation', with: '123456'
        select 'User', from: 'user[role]'
      end
      click_button 'commit'
      click_button 'logout'
    end

    User.all
  end

  def create_posts(users)
    users.each do |user|
      (1..5).each do |j|
        visit new_user_post_path(user.id)
        within('form') do
          fill_in 'title', with: "#{user.name} post #{j}"
          fill_in 'text', with: "#{user.name} text #{j}"
        end
        click_button 'Publish'
      end
    end

    Post.all
  end

  def create_likes_comments(users, posts)
    posts.each do |post|
      (0..2).each do |j|
        Like.create(author_id: users[j].id, post_id: post.id)
        Comment.create(author_id: users[j].id, post_id: post.id,
                       text: "I'm #{users[j].name} and I'm commenting gibberish here.")
      end
    end
  end
end
