class OrdersController < ApplicationController
  before_action :authenticate_user!

#  def create 
#   order = current_user.orders.create(cart: current_cart, status: 0)
#   cookies.delete(:cart_id)
#   redirect_to order_path(order), notice: 'Order was successfully created'
#  end 

  def create
    @order = Order.create(order_params)
    @order.update(user: current_user, cart: current_cart)
    @order.save
    cookies.delete(:cart_id)
    redirect_to orders_path(@order)
  end

  def show
    @order = current_user.orders.find(params[:id])
  end

  def index
    @orders = current_user.orders
  end

  def new
    @order = Order.new
  end

  def switch_status
    @order = current_user.orders.find_by(id: params[:id])
    @order.update(status: :paid)
    redirect_back fallback_location: cart_path
  end

  def order_params
    params.require(:order).permit(:name, :email, :address)
  end
end
