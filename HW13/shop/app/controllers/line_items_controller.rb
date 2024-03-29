class LineItemsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_line_item, only: %i[destroy update]

  def create
    product = Product.find(params[:product_id])
    @line_item = current_cart.line_items.find_by(product: product)

    if @line_item.present?
      @line_item.update(quantity: @line_item.quantity + 1)
    else
      @line_item = current_cart.add_product(product)
    end

    redirect_to cart_path, notice: "#{product.name} was successfully added to the cart"
  end

  def update
    @line_item.quantity -= 1 if params[:change_quantity] == 'decrease'
    @line_item.quantity += 1 if params[:change_quantity] == 'increase'
    @line_item.update(quantity: @line_item.quantity)

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
