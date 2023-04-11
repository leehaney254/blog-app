require 'rails_helper'

RSpec.feature 'Users', type: :feature do
  before do
    @user1 = User.create(name: 'user1', posts_counter: 3,
                         photo: 'https://newprofilepic2.photo-cdn.net//assets/images/article/profile.jpg')
    @user2 = User.create(name: 'user2', posts_counter: 2,
                         photo: 'https://newprofilepic2.photo-cdn.net//assets/images/article/profile.jpg')
    @user3 = User.create(name: 'user3', posts_counter: 1,
                         photo: 'https://newprofilepic2.photo-cdn.net//assets/images/article/profile.jpg')
  end

  scenario 'User visits the index page' do
    visit users_path

    expect(page).to have_content('user1')
    expect(page).to have_content('user2')
    expect(page).to have_content('user3')

    expect(page).to have_selector('.user-photo', count: 3)

    expect(page).to have_content(@user1.posts_counter)
    expect(page).to have_content(@user2.posts_counter)
    expect(page).to have_content(@user3.posts_counter)

    expect(page).to have_link('user1', href: user_path(@user1))
    expect(page).to have_link('user2', href: user_path(@user2))
    expect(page).to have_link('user3', href: user_path(@user3))
  end
end
