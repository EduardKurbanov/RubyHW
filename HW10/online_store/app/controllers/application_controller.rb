class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  rescue_from ActiveRecord::RecordNotFound, with: :notfound

  rescue_from ActionController::RoutingError, with: :notfound!

  def notfound!
    logger.error 'Routing error occurred'
    render file: 'public/404.html', status: :not_found, layout: false
  end

  private

  def notfound(exception)
    logger.warn exception
    render file: 'public/404.html', status: :not_found, layout: false
  end
end
