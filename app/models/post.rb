class Post < ApplicationRecord
  belongs_to :user

  has_many :comments, dependent: :destroy

  self.per_page = 10

  validate :user_wait

  def your_posts
    user.posts
  end

  def user_wait
    if user and (Time.now - your_posts[-1].created_at < 10)
      errors.add(:message, "you can create new post after 10 sec")
    end
  end

  private
  def user
    User.find(user_id)
  end
end
