class PostSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :image
  belongs_to :user
  has_many :comments
end
