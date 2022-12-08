class Article < ApplicationRecord
  has_many :comments, dependent: :destroy
  has_many :articletags
  has_many :tags, through: :articletags
  has_many :likes, as: :likeable

  validates :body, presence: true, length: { minimum: 1 }
  validates :title, presence: true, length: { minimum: 1 }
end
