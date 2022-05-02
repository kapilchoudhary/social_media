class User < ApplicationRecord
  has_secure_password

  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy

  has_many :friend_requestor, foreign_key: :requestor_id, class_name: :FriendRequest
  has_many :friend_receiver, foreign_key: :receiver_id, class_name: :FriendRequest

  validates :first_name, presence: {message: "First name field is empty."}
  validates :last_name, presence: {message: "Last name field is empty."}
  validates :email, uniqueness: {message: "This email is already registered."}
  validates :password, presence: true

end
