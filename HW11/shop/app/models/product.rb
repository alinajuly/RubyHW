class Product < ApplicationRecord
  belongs_to :category
  has_many :line_items, dependent: :destroy

  validates :name, :description, :category_id, presence: true
  validates :image, presence: false
  validates :price, presence: true, numericality: { greater_than: 0 }
end
