class OrdersController < ApplicationController
  before_action :authenticate_user!

  def create
    @order = Order.create(order_params)
    @order.update(user: current_user, cart: current_cart)
    @order.save
    cookies.delete(:cart_id)
    redirect_to orders_path(@order)
  end

  def show
    @order = current_user.orders.find(params[:id])
    @line_items = @order.cart.line_items.includes(:product)
  end

  def index
    @orders = current_user.orders
  end

  def new
    @order = Order.new
  end

  def update
    @order = current_user.orders.find_by(id: params[:id])
    @order.paid!
    UserMailer.order(current_user, @order).deliver_later
    redirect_back fallback_location: home_path, notice: 'success'
  end

  def order_params
    params.require(:order).permit(:name, :email, :address)
  end
end
