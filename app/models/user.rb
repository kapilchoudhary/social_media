class User < ApplicationRecord
  has_secure_password

  has_many :posts

  validates :first_name, presence: {message: "First name field is empty."}
  validates :last_name, presence: {message: "Last name field is empty."}
  validates :email, uniqueness: {message: "This email is already registered."}
  validates :password, presence: true

end
