# == Schema Information
#
# Table name: products
#
#  id          :bigint           not null, primary key
#  name        :string
#  description :text
#  price       :decimal(, )
#  image       :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  category_id :bigint           not null
#
class Product < ApplicationRecord
  belongs_to :category
  has_many :line_items, dependent: :destroy

  validates :name, :description, :category_id, presence: true
  validates :image, presence: false
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 0 }
end
