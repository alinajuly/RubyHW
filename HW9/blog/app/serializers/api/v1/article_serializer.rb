class Api::V1::ArticleSerializer < ActiveModel::Serializer
  attributes :id, :title, :body, :created_at, :author, :comments
  
  has_one :author
  
  def comments
    ActiveModel::SerializableResource.new(object.comments.last_comments, each_serializer: Api::V1::CommentSerializer)
  end
end