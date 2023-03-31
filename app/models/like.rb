class Like < ApplicationRecord
  belongs_to :user
  belongs_to :post

  def self.update_likes_counter(post_id)
    post = Post.find(post_id)
    likes_count = post.likes.count
    post.update(likes_counter: likes_count)
  end
end
