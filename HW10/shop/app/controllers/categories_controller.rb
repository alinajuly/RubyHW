class CategoriesController < ApplicationController
  before_action :set_category, only: %i[show]
  
  def show
    @products = @category.products
  end

  private

  # Use callbacks to share common setup or constraints between actions
  def set_category
    @category = Category.find_by(id: params[:id])
  end
end
