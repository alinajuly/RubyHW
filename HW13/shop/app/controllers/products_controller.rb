class ProductsController < ApplicationController
  before_action :set_product, only: %i[show]

  def index
    @products = Product.all
  end

  def show; end

  private

  def set_product
    @product = Product.find(params[:id])
  rescue ActiveRecord::RecordNotFound => e
    logger.info e
    return render json: { message: 'product is not found' }, status: :not_found
  end

  def product_params
    params.require(:product).permit(:name, :description, :price, :image)
  end
end
