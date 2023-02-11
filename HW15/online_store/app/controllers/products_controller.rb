class ProductsController < ApplicationController
  
  def index
    @products = Product.all.with_attached_image
  end

  def show
    @product = Product.find(params[:id])
  end


end

