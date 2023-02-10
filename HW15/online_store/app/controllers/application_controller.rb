class ApplicationController < ActionController::Base
  before_action :handle_cookies 
  #before_action :authenticate_user!
  rescue_from ActiveRecord::RecordNotFound, with: :notfound
  rescue_from ActionController::RoutingError, with: :notfound!
  helper_method :current_cart, :cart_total_quantity, :current_product_quantity
  
  def notfound!
    logger.error 'Routing error occurred'
    render file: 'public/404.html', status: :not_found, layout: false
  end

  private

  def current_cart
    Cart.find(cookies[:cart_id])
  end

  def handle_cookies
    cookies[:cart_id] = Cart.create.id unless cookies[:cart_id].present?
  end

  def cart_total_quantity
    current_cart.line_items.map(&:quantity).sum
  end

  def current_product_quantity(product_id)
    current_cart.line_items.find_by(product_id: product_id) if cookies[:cart_id].present?
  end

  def notfound(exception)
    logger.warn exception
    render file: 'public/404.html', status: :not_found, layout: false
  end
end
