class FriendRequest < ApplicationRecord
  belongs_to :requestor, class_name: :User
  belongs_to :receiver, class_name: :User

  validates :receiver_id, presence: true, uniqueness: {message: "This User is already your friend "}
end
