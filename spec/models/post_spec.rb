require 'rails_helper'

RSpec.describe Post, type: :model do
  context 'validation tests' do
    before(:each) do
      first_user = User.create(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.') 
      post = Post.create(author: first_user, title: 'Hello', text: 'This is my third post')
    end
  end
end
