class Post < ApplicationRecord
  has_many :comments
  has_many :likes
  belongs_to :author, class_name: 'User'

  after_save :update_post_counter

  validates :Title, presence: true, length: {maximum: 250}
  validates :CommentsCounter, :LikesCounter, numericality: {only_integer: true, greater_than_or_equal_to: 0}

  def recent_comments
    comments.order(created_at: :desc).limit(5)
  end

  private

  def update_post_counter
    author.update(posts_counter: author.posts.count)
  end
end
