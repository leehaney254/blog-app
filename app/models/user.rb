class User < ApplicationRecord
  has_many :comments
  has_many :posts, foreign_key: :author_id
  has_many :likes

  def recent_posts
    self.posts.order(created_at: :desc).limit(3)
  end
end
