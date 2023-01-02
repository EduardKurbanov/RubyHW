class LineItemsController < ApplicationController
  before_action :authenticate_user!

  def create
    product = Product.find(params[:product_id])
    current_cart.add_product(product)

    redirect_to cart_path, notice: "#{product.name} was successfully added to the cart"
  end

  def destroy
    @line_item = LineItem.find(params[:id])
    @line_item.destroy
#    redirect_to cart_path(@current_cart)
    redirect_back(fallback_location: current_cart)
  end 

  def add_quantity
    @line_item = LineItem.find(params[:id])
    @line_item.quantity += 1
    @line_item.save
#    redirect_to cart_path(@current_cart)
    redirect_back(fallback_location: current_cart)
  end
  
  def reduce_quantity
    @line_item = LineItem.find(params[:id])
    if @line_item.quantity > 1
      @line_item.quantity -= 1
      @line_item.save
      redirect_back(fallback_location: current_cart)
    elsif @line_item.quantity == 1
      destroy
    end
  end
end
