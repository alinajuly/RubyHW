class Category < ApplicationRecord
  has_many :products, dependent: :destroy

  validates :title, presence: true, length: { minimum: 1 }
end
