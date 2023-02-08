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

    respond_to do |format|
      format.html { redirect_to cart_path, notice: "#{product.name} was successfully added to the cart" }
      format.turbo_stream
    end
  end

  def update
    @line_item.quantity -= 1 if params[:change_quantity] == 'decrease'
    @line_item.quantity += 1 if params[:change_quantity] == 'increase'
    @line_item.update(quantity: @line_item.quantity)
    
    respond_to do |format|
      format.html { redirect_to cart_path(current_cart) }
      format.turbo_stream
    end
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
