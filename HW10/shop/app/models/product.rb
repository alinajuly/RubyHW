class Product < ApplicationRecord
  belongs_to :category

  validates :name, :description, :price, :image, :category_id, presence: true, length: { minimum: 1 }
end
