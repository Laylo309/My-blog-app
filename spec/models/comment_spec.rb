require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe '#update_comments_counter' do
    user = User.create(name: 'User 1', bio: 'User bio')
    post = Post.create(title: 'Post 1', text: 'Sample post text', user: user)
    subject { Comment.create(text: 'Comment', post: post, user: user) }

    it 'should increment the post comments counter' do
      expect(subject.post.comments_counter).to eq(1)
    end
  end
end
