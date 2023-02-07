# == Schema Information
#
# Table name: carts
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Cart < ApplicationRecord
  has_many :line_items, dependent: :destroy
  has_many :products, through: :line_items
  has_one :order, dependent: :destroy

  def add_product(product)
    line_items.create(product: product, quantity: 1)
  end

  def total_price
    line_items.map(&:total_price).sum
  end

  def total_quantity
    line_items.to_a.sum(&:quantity)
  end
end