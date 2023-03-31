require 'rails_helper'

RSpec.describe User, type: :model do
  context 'validation tests' do
    first_user = User.create(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
                             bio: 'Teacher from Mexico.')

    it 'posts_counter must be numeric' do
      subject.posts_counter = 'one'
      expect(subject).to_not be_valid
    end

    it 'is invalid without a name' do
      first_user.name = nil
      expect(first_user).to_not be_valid
    end

    it 'posts_counter must be an integer' do
      subject.posts_counter = 4
      expect(subject).to_not be_valid
    end

    it 'posts_counter should be greater than or equal to 0' do
      subject.posts_counter = -3
      expect(subject).to_not be_valid
    end
  end
end
