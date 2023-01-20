class ProductsController < ApplicationController
  
  def index
    @products = Product.all.includes(image_attachment: :blob)
  end

  def show
    @product = Product.find(params[:id])
  end
end

