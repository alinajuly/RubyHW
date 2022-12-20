class Comment < ApplicationRecord
  belongs_to :article
  belongs_to :author
  has_many :likes, as: :likeable, dependent: :destroy

  scope :with_status, ->(status_type) { where(status: status_type) }
  scope :last_comments, ->(limit = 10) { order(created_at: :desc).limit(limit) }
  enum status: { unpublished: 0, published: 1 }

  validates :article_id, :author_id, :body, presence: true, length: { minimum: 1 }
end
