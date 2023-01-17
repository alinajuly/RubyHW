class ApplicationController < ActionController::Base
  helper_method :current_cart, :category_all
  
  def current_cart
    Cart.find(cookies[:cart_id])
  rescue ActiveRecord::RecordNotFound
    cart = Cart.create
    cookies[:cart_id] = cart.id
    cart
  end

  def category_all
    @categories = Category.all
  end
end
