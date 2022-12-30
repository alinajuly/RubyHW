class Product < ApplicationRecord
  belongs_to :category
  has_many :line_item, dependent: :nullify

  validates :name, :description, :price, :category_id, presence: true, length: { minimum: 1 }
  validates :image, presence: false
end
