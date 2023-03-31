class Post < ApplicationRecord
  has_many :comments
  has_many :likes
  belongs_to :author, class_name: 'User'

  def self.update_post_counter(user_id)
    user = User.find(user_id)
    user.update(posts_counter: user.posts.count)
  end

  def recent_comments
    self.comments.order(created_at: :desc).limit(5)
  end
end
