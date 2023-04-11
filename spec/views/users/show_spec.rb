require 'rails_helper'

RSpec.feature 'Users Posts', type: :feature do
  before do
    @user1 = User.create(name: 'user1', posts_counter: 3, photo: 'https://newprofilepic2.photo-cdn.net//assets/images/article/profile.jpg')
    @user1.posts.create(title: 'Post1', text: 'This is my first post', comments_counter: 0, likes_counter: 0)
    @post2 = @user1.posts.create(title: 'Post2', text: 'This is my second post', comments_counter: 0, likes_counter: 0)
    @user1.posts.create(title: 'Post3', text: 'This is my third post', comments_counter: 0, likes_counter: 0)
    @user1.posts.create(title: 'Post4', text: 'This is my fourth post', comments_counter: 0, likes_counter: 0)
    visit user_path(@user1)
  end

  scenario 'I can see the user profile picture' do
    expect(page).to have_selector('.user-photo', count: 1)
  end

  scenario 'I can see the username of the user' do
    expect(page).to have_content('user1')
  end

  scenario 'I can see the number of posts written by user' do
    expect(page).to have_content(@user1.posts_counter)
  end

  scenario 'I can see the bio of the user' do
    expect(page).to have_content(@user1.bio)
  end

  scenario 'I can see the user first 3 posts' do
    expect(page).to have_content('Post2')
    expect(page).to have_content('Post3')
    expect(page).to have_content('Post4')
    expect(page).to_not have_content('Post1')
  end

  scenario 'I can see a link to see all posts' do
    expect(page).to have_link('See all Posts', href: user_posts_path(@user1.id))
  end

  scenario 'When I click a user post, it redirects me to that post show page' do
    link = find('.post-link', text: 'Post2')
    link.click
    expect(page).to have_current_path(user_post_path(@user1.id, @post2.id))
  end

  scenario 'When I click on the See all Posts link, it redirects me to the user posts index page' do
    click_link 'See all Posts'
    expect(page).to have_current_path(user_posts_path(@user1.id))
  end
end
