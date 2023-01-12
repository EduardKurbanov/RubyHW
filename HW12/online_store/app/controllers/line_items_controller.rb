class LineItemsController < ApplicationController  
  before_action :authenticate_user!
  before_action :set_line_item, only: %i[destroy add_quantity reduce_quantity]

  def create
    @line_item = current_cart.line_items.find_by(product_id: params[:product_id])
    if @line_item.present?
      @line_item.update(quantity: @line_item.quantity + 1)
    else
      @line_item = current_cart.line_items.create(product_id: params[:product_id])
    end
    redirect_back fallback_location: cart_path
  end

  def destroy
    @line_item.destroy
    redirect_back(fallback_location: current_cart)
  end 

  def add_quantity
    @line_item.quantity += 1
    @line_item.save
    redirect_back(fallback_location: current_cart)
  end
  
  def reduce_quantity
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

  def set_line_item
    @line_item = LineItem.find(params[:id])
  end
end
