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
  end

  # Only allow a list of trusted parameters through
  def product_params
    params.require(:product).permit(:name, :description, :price, :image)
  end
end
