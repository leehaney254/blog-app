require 'rails_helper'

RSpec.describe Post, type: :model do
  context 'validation tests' do
    first_user = User.create(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.', posts_counter: 0) 
    second_post = Post.create(author: first_user, title: 'Hello', text: 'This is my third post',comments_counter: 0, likes_counter: 0)

    it 'is not valid without a title' do
      second_post.title = nil
      expect(second_post).to_not be_valid
    end    

    it 'likes_counter should be greater than or equal to 0' do
      second_post.likes_counter = -1
      expect(second_post).to_not be_valid
    end

    it 'is should not be more than 250 characters' do
      first_post = Post.create(
        title: 'This is a very very very very very very very very very very very very very very very very very very very very very very very very very very very very very very very very very very very very looooooooooooooooooooooooooooooooong title', text: 'This is my third post',comments_counter: 0, likes_counter: 0)
      expect(first_post).to_not be_valid
    end

    it 'likes_counter should be an integer' do
      second_post.likes_counter = 1.5
      expect(second_post).to_not be_valid
    end

    it 'comments_counter should be greater than or equal to 0' do
      second_post.comments_counter = -1
      expect(second_post).to_not be_valid
    end
  end
end
