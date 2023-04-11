require 'rails_helper'

RSpec.feature 'Likes', type: :feature do
  before do
    @user = User.create(name: 'user', posts_counter: 3,
                        photo: 'https://unsplash.com/photos/F_-0BxGuVvo')
    @post = @user.posts.create(title: 'post', text: 'This is my first post', comments_counter: 0, likes_counter: 0)
    p @post
  end

  scenario 'User likes a post' do
    visit user_post_path(@user, @post)

    expect(page).to have_content('post')
    expect(page).to have_content('Likes: 0')

    click_button 'Like post'

    expect(page).to have_content('post')
    expect(page).to have_content('Likes: 1')
  end
end
