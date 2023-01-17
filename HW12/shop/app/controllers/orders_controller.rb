class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_order, only: %i[show destroy]

  def index
    @orders = current_user.orders
  end

  def create
    @order = current_user.orders.create(cart: current_cart)
    @order.update(user: current_user, cart: current_cart)

    cookies.delete(:cart_id)
    redirect_to order_path(@order), notice: 'Order was successfully created'
  end

  def show; end

  # def payment
  #   @order = current_user.orders.find(params[:format])
  # end

  # def confirm_payment
  #   @order.paid!

  #   redirect_to orders_path, notice: 'Order was successfully payed'
  # end

  def destroy
    @order.destroy

    redirect_to orders_path(@order)
  end

  private

  def set_order
    @order = current_user.orders.find(params[:id])
  end
end
