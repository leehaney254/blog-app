require 'rails_helper'

RSpec.describe 'Hello world', type: :feature do
  before do
    @user = User.create(name: 'Tom', photo: 'https://wallpapers.com/images/featured/87h46gcobjl5e4xu.jpg',
                        bio: 'Teacher from Mexico.', posts_counter: 0)
    @second_post = Post.create(author: @user, title: 'Hello', text: 'This is my third post', comments_counter: 0,
                               likes_counter: 0)
    @first_comment = Comment.create(post: @second_post, user: @user, text: 'Hi jxu!')
    visit user_post_path(@user.id, @second_post.id)
  end

  scenario 'show page url' do
    expect(page).to have_current_path(user_post_path(@user.id, @second_post.id))
  end

  scenario 'show page has post title' do
    assert page.has_content?(@second_post.title)
  end

  scenario 'show page has a posts author\'s name' do
    assert page.has_content?(@user.name)
  end

  scenario 'show page has no of comments and likes on a post' do
    assert page.has_content?('Comments: 1')
    assert page.has_content?('Likes: 0')
  end

  scenario 'show page has a posts body' do
    assert page.has_selector?('p', text: @second_post.text)
  end

  scenario 'show page has comment\'s username' do
    assert page.has_selector?('h3', text: @first_comment.user.name)
  end

  scenario 'show page has user\'s comment' do
    assert page.has_selector?('h5', text: @first_comment.text)
  end
end
