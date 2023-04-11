require 'rails_helper'

RSpec.describe 'Hello world', type: :feature do
  before do
    @user = User.create(name: 'Tom', photo: 'https://wallpapers.com/images/featured/87h46gcobjl5e4xu.jpg',
      bio: 'Teacher from Mexico.', posts_counter: 0)
    @second_post = Post.create(author: @user, title: 'Hello', text: 'This is my third post', comments_counter: 0,
      likes_counter: 0)
    @first_comment = Comment.create(post: @second_post, user: @user, text: 'Hi jxu!')
      visit user_posts_path(@user.id)
  end

  scenario 'index page url' do 
    expect(page).to have_current_path(user_posts_path(@user.id))
  end

  scenario 'index page has profile picure' do
    assert page.has_selector?(:xpath, "//img[contains(@src,'https://wallpapers.com/images/featured/87h46gcobjl5e4xu.jpg')]")
  end

  scenario 'index page has username' do
    assert page.has_content?(@user.name)
  end

  scenario 'index page has number of posts' do
    assert page.has_content?("Number of posts: 1")
  end

  scenario 'index page has a posts body' do
    assert page.has_selector?('p', text: @second_post.text)
  end

  scenario 'index page has a first comment' do
    assert page.has_selector?('h5', text: @first_comment.text)
  end

  scenario 'index page has no of comments and likes on a post' do
    assert page.has_content?("Comments: 1")
    assert page.has_content?("Likes: 0")
  end

  scenario 'index page has pagination' do
    assert page.has_css?('.pagy-nav')
    assert page.has_css?('.pagination')
  end
end