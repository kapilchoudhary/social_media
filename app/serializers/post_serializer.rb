class PostSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :image
  belongs_to :user
end
