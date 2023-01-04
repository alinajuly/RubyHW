class Cart < ApplicationRecord
  has_many :line_items, dependent: :nullify
  has_many :products, through: :line_items

  def add_product(product)
    line_item.create(product: product, quantity: 1)
  end


  def total_price
    products.sum(&:price)
  end

  def grouped_line_items
    line_items
      .joins(:product)
      .select(:id, :product_id, "products.price, line_items.quantity, products.name, products.image")
      .map(&:attributes)
      .map(&:symbolize_keys)
      .group_by {|product| product[:product_id]}
      .values
  end

  def transformed_line_items
    grouped_line_items.map do |line_items| 
      { 
        quantity: line_items.sum { |line_item| line_item[:quantity] }, 
        name: line_items.first[:name], 
        price: line_items.sum { |line_item| line_item[:price] }, 
        id: line_items.first[:id], 
        image: line_items.first[:image]
      }
    end
  end
end
