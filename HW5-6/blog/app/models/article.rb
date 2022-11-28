class Article < ApplicationRecord
  has_many :comments, dependent: :destroy

  validates :body, presence: true, length: { minimum: 1 }
  validates :title, presence: true, length: { minimum: 1 }
end
