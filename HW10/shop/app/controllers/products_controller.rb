class ProductsController < ApplicationController
  before_action :set_product, only: %i[show]

  # GET /products
  def index
    @products = Product.all
  end

  # GET /products/:id
  def show; end

  private

  # Use callbacks to share common setup or constraints between actions
  def set_product
    @product = Product.find(params[:id])
  rescue ActiveRecord::RecordNotFound => e
    logger.info e
    return render json: { message: 'product id not found' }, status: :not_found
  end

  # Only allow a list of trusted parameters through
  def product_params
    params.require(:product).permit(:name, :description, :price, :image)
  end
end
