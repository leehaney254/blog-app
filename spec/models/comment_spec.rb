require 'rails_helper'

RSpec.describe Comment, type: :model do
  context 'validation tests' do
    first_user = User.create(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
                             bio: 'Teacher from Mexico.', posts_counter: 0)
    second_post = Post.create(author: first_user, title: 'Hello', text: 'This is my third post', comments_counter: 0,
                              likes_counter: 0)
    first_comment = Comment.create(post: second_post, user: first_user, text: 'Hi jxu!')

    it 'posts comments count should be 1' do
      expect(second_post.comments_counter).to eq 1
    end

    it 'can be saved without text' do
      first_comment.text = nil
      expect(first_comment).to be_valid
    end
  end
end
