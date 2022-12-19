class Api::V1::ArticlesSerializer < ActiveModel::Serializer
  attributes :id, :title, :body, :created_at, :author

  has_one :author
end
