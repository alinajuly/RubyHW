class Product < ApplicationRecord
  belongs_to :category
  has_many :line_item, dependent: :nullify

  validates :name, :description, :category_id, presence: true
  validates :image, presence: false
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 0 }
end
