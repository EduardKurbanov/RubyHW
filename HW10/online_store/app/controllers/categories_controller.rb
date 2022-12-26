class CategoriesController < ApplicationController
  before_action :set_category, only: %i[show edit update destroy]

  def index
    @categories = Category.all
  end

  def show
    @products = @category.products
  end

  def create
    @category = Category.new(category_params)

    if @category.save
      redirect_to @category, notice: "Category created."
    else
      render :show, status: :unprocessable_entity
    end
  end

  def edit; end

  def destroy
    @category.destroy
  end

  private

  def set_category
    @category = Category.find_by(id: params[:id])
    if @category.nil?
      @categories = Category.all
      flash.now[:alert] = "Your category was not found"
      redirect_to products_path
    end
  end

  def category_params
    params.require(:category).permit(:name, :description, :price, :image)
  end
end

