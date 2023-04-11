require 'rails_helper'

RSpec.describe 'Hello world', type: :feature do
  before do
    @user = User.create(name: 'Tom', photo: 'https://wallpapers.com/images/featured/87h46gcobjl5e4xu.jpg',
                        bio: 'Teacher from Mexico.', posts_counter: 0)
    @second_post = Post.create(author: @user, title: 'Hello', text: 'This is my third post', comments_counter: 0,
                               likes_counter: 0)
    @first_comment = Comment.create(post: @second_post, user: @user, text: 'Hi jxu!')
  end

  scenario 'show page url and form url' do
    visit user_path(@user.id)
    expect(page).to have_current_path(user_path(@user.id))
    click_button('Create Post')
    expect(page).to have_current_path(new_user_post_path(@user))
  end

  scenario 'create post' do
    visit user_path(@user.id)
    click_button('Create Post')
    fill_in('title', with: 'Form testing at it\'s best')
    fill_in('text', with: 'This is the A team filling in a test form')
    click_button('Create Post')
    expect(page).to have_current_path(user_path(@user.id))
    expect(page).to have_content('Post saved successfully.')
  end
end
