class Category < ApplicationRecord
  has_many :products

  validates :title, presence: true, length: { minimum: 1 }
end
