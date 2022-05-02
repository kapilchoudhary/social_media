class FriendRequestorSerializer < ActiveModel::Serializer
  attributes :status
  belongs_to :requestor
end