class Article < ApplicationRecord
  belongs_to :author
  has_many :comments, dependent: :destroy
  has_many :article_tags
  has_many :tags, through: :article_tags
  has_many :likes, as: :likeable

  scope :search_by_phrase, ->(params) { where('title || body ILIKE ?', "%#{params}%") }
  enum status: { unpublished: 0, published: 1 }

  validates :body, :title, :author_id, presence: true, length: { minimum: 1 }
end
