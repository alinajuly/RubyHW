class Comment < ApplicationRecord
  belongs_to :article
  belongs_to :author
  has_many :likes, as: :likeable

  scope :with_status, ->(status_type) { where(status: status_type) }
  scope :last_ten_comments, -> { order(created_at: :desc).last(10) }
  enum status: { unpublished: 0, published: 1 }

  validates :body, presence: true, length: { minimum: 1 }
  validates :author_id, presence: true
  validates :article_id, presence: true
end
