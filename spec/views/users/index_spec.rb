require 'rails_helper'

RSpec.feature 'Users', type: :feature do
  before do
    @user1 = User.create(name: 'user1', photo: 'https://wallpapers.com/images/featured/87h46gcobjl5e4xu.jpg',
                         bio: 'Teacher from Mexico.', posts_counter: 0)
    @user2 = User.create(name: 'user2', photo: 'https://wallpapers.com/images/featured/87h46gcobjl5e4xu.jpg',
                         bio: 'Teacher from Mexico.', posts_counter: 0)
    @user3 = User.create(name: 'user3', photo: 'https://wallpapers.com/images/featured/87h46gcobjl5e4xu.jpg',
                         bio: 'Teacher from Mexico.', posts_counter: 0)

    visit users_path
  end

  scenario 'I can see the username of all other users' do
    expect(page).to have_content('user1')
    expect(page).to have_content('user2')
    expect(page).to have_content('user3')
  end

  scenario 'I can see profile pictures of all users' do
    expect(page).to have_selector('.user-photo')
  end

  scenario 'I can see the number of posts written by users' do
    expect(page).to have_content(@user1.posts_counter)
    expect(page).to have_content(@user2.posts_counter)
    expect(page).to have_content(@user3.posts_counter)
  end

  scenario 'When I click on a user, I am redirected to that user show page' do
    link = find('.user-link', text: 'user1')
    link.click
    expect(page).to have_current_path(user_path(@user1))
  end
end
