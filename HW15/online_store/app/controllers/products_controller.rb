class ProductsController < ApplicationController
  
  def index
    @products = Product.all.with_attached_image
  end

  def show
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find_by(id: params[:id])
    if @product.nil?
      @products = Product.all
      flash.now[:alert] = 'Your product was not found'
      render 'index'
    end

    @line_item = current_cart.line_items.find_by(product: @product)

    @line_item = current_cart.line_items.create(product: @product) unless @line_item.present?

    quantity = params[:action_item] == 'increase' ? @line_item.quantity + 1 : @line_item.quantity - 1
    @line_item.update(quantity: quantity)
    if @line_item.quantity <= 1
      @line_item.update(quantity: @line_item.quantity = 1)
    end

    respond_to do |format|
      format.html { redirect_back fallback_location: products_path }
      format.turbo_stream
    end
  end
end

