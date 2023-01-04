class LineItemsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_line_item, only: %i[destroy increase_quantity decrease_quantity]

  def create
    product = Product.find(params[:product_id])
    current_cart.add_product(product)
  
    redirect_to cart_path, notice: "#{product.name} was successfully added to the cart"
  end

  def update
    @line_item.update(quantity: @line_item.quantity - 1) if params[:decrease_quantity]
    @line_item.update(quantity: @line_item.quantity + 1) if params[:increase_quantity]
    redirect_to cart_path(current_cart)
  end

  def destroy
    @line_item.destroy

    redirect_to cart_path(current_cart)
  end

  private

  def set_line_item
    @line_item = LineItem.find(params[:id])
  end
end
