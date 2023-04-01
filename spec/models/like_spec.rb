require 'rails_helper'

RSpec.describe Like, type: :model do
  context 'validation tests' do
    first_user = User.create(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
                             bio: 'Teacher from Mexico.', posts_counter: 0)
    second_post = Post.create(author: first_user, title: 'Hello', text: 'This is my third post', comments_counter: 0,
                              likes_counter: 0)
    first_like = Like.create(post: second_post, user: first_user)

    it 'is invalid without a posts_id' do
      first_like.post_id = nil
      expect(first_like).to_not be_valid
    end

    it 'count should have one like' do
      expect(second_post.likes_counter).to eq 1
    end

    it 'is not valid without a users_id' do
      first_like.user_id = nil
      expect(first_like).to_not be_valid
    end
  end
end
