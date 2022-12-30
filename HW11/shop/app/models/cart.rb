class Cart < ApplicationRecord
  has_many :line_item, dependent: :nullify

  def add_product(product)
    line_items.create(product: product, quantity: 1)
  end
end
