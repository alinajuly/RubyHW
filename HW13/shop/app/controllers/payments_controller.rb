class PaymentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_payment, only: %i[edit update]

  def edit
    @order = current_user.orders.find(params[:id])
  end

  def update
    @order.paid!

    redirect_to orders_path, notice: 'Order was successfully payed'
    
    user = current_user
    order = @order
    UserMailer.order_confirmation(user, order).deliver_now
  end

  private

  def set_payment
    @order = current_user.orders.find(params[:id])
  end
end
