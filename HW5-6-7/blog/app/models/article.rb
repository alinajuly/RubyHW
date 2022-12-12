class Article < ApplicationRecord
  has_many :comments, dependent: :destroy
  has_many :articletags
  has_many :tags, through: :article_tags
  has_many :likes, as: :likeable

  validates :body, :title, presence: true, length: { minimum: 1 }
end
