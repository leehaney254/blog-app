require 'rails_helper'

RSpec.feature 'Comments', type: :feature do
  before do
    @user = User.create(name: 'user', posts_counter: 3,
                        photo: 'https://unsplash.com/photos/F_-0BxGuVvo')
    @post = @user.posts.create(title: 'post', text: 'This is my first post', comments_counter: 0, likes_counter: 0)
    @comment = @post.comments.create(text: 'This is my first comment')
  end

  scenario 'User comments a post' do
    visit user_post_path(@user, @post)

    expect(page).to have_content('post')
    expect(page).to have_content('Comments: 0')

    click_link 'Comment'
    fill_in 'Comment', with: 'This is my first comment'
    click_button 'Comment'

    expect(page).to have_content('post')
    expect(page).to have_content('Comments: 1')
  end
end
