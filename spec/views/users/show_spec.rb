require 'rails_helper'

RSpec.feature 'Users Posts', type: :feature do
  before do
    @user1 = User.create(name: 'user1', posts_counter: 3, photo: 'https://newprofilepic2.photo-cdn.net//assets/images/article/profile.jpg')
    @user1.posts.create(title: 'Post1', text: 'This is my first post', comments_counter: 0, likes_counter: 0)
    @post2 = @user1.posts.create(title: 'Post2', text: 'This is my second post', comments_counter: 0, likes_counter: 0)
    @user1.posts.create(title: 'Post3', text: 'This is my third post', comments_counter: 0, likes_counter: 0)
    @user1.posts.create(title: 'Post4', text: 'This is my fourth post', comments_counter: 0, likes_counter: 0)
  end

  scenario 'User visits show user page' do
    visit user_path(@user1)

    expect(page).to have_content('user1')
    expect(page).to have_selector('.user-photo', count: 1)
    expect(page).to have_content(@user1.posts_counter)
    expect(page).to have_content(@user1.bio)
    expect(page).to have_link('See all Posts', href: user_posts_path(@user1.id))
    expect(page).to have_content('Post2')
    expect(page).to have_content('Post3')
    expect(page).to have_content('Post4')
    expect(page).to_not have_content('Post1')
  end
end
