class Api::V1::ArticleSerializer < ActiveModel::Serializer
  attributes :id, :title, :body, :created_at, :author
  
  has_one :author
  has_many :comments
end
