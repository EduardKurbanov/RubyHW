class CategoriesController < ApplicationController

  def index
    @categories = Category.all.with_attached_image
  end

  def show
    @category = Category.find(params[:id])
    @products = @category.products.with_attached_image
  end
end

