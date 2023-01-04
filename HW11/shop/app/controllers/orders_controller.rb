class OrdersController < ApplicationController
  before_action :authenticate_user!

  def create
    order = current_user.orders.create(cart: current_cart, status: 'unpaid')
    # cookies.delete(:cart_id)

    redirect_to order_path(order), notice: 'Order was successfully created'
  end

  def show
    @order = current_user.orders.find(params[:id])
  end
end
