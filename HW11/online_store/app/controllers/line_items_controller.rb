class LineItemsController < ApplicationController
  before_action :authenticate_user!

  def create
#    product = Product.find(params[:product_id])
#    current_cart.add_product(product)
#    redirect_to cart_path, notice: "#{product.name} was successfully added to the cart"
    @line_item = current_cart.line_items.find_by(product_id: params[:product_id])
    if @line_item.present?
      @line_item.update(quantity: @line_item.quantity + 1)
    else
      @line_item = current_cart.line_items.create(product_id: params[:product_id])
    end
    redirect_back fallback_location: cart_path
  end

  def destroy
    @line_item = LineItem.find(params[:id])
    @line_item.destroy
    redirect_back(fallback_location: current_cart)
  end 

  def add_quantity
    @line_item = LineItem.find(params[:id])
    @line_item.quantity += 1
    @line_item.save
    redirect_back(fallback_location: current_cart)
  end
  
  def reduce_quantity
    @line_item = LineItem.find(params[:id])
    if @line_item.quantity > 1
      @line_item.quantity -= 1
      @line_item.save
      redirect_back(fallback_location: current_cart)
    elsif @line_item.quantity <= 1
      #destroy
      @line_item.quantity = 1
      @line_item.save
      redirect_back(fallback_location: current_cart)
    end
  end
end
