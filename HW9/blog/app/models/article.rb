class Article < ApplicationRecord
  belongs_to :author
  has_many :comments, dependent: :destroy
  has_many :article_tags
  has_many :tags, through: :article_tags
  has_many :likes, as: :likeable, dependent: :destroy

  scope :search_by_phrase, ->(params) { where('title || body ILIKE ?', "%#{params}%") }
  scope :filter_by_status, ->(status_type) { where(status: status_type) }
  scope :search_by_author_name, ->(name) { joins(:author).where('name LIKE ?', "%#{name}%") }
  scope :search_by_tag, ->(tags) { joins(:tags).where('tags.title ILIKE ANY (array[?])', tags.strip.split(',')) }
  scope :sort_by_order, ->(order = 'asc') { order(title: order.downcase) }

  enum status: { unpublished: 0, published: 1 }

  validates :body, :title, :author_id, presence: true, length: { minimum: 1 }
end
