class ProductsController < ApplicationController
  before_action :authenticate_user!, expect: %i[index show]
  before_action :set_product, only: %i[show edit update destroy]

  def index
    @products = Product.all
  end

  def show; end

  def create
    @product = Product.new(product_params)

    if @product.save
      redirect_to @product, notice: "Product created."
    else
      render :show, status: :unprocessable_entity
    end
  end

  def edit; end

  def destroy
    @product.destroy
  end

  private

  def set_product
    @product = Product.find_by(id: params[:id])
    if @product.nil?
      @products = Product.all
      flash.now[:alert] = "Your product was not found"
      redirect_to products_path
    end
  end

  def product_params
    params.require(:product).permit(:name, :description, :price, :image)
  end
end

