class ApplicationController < ActionController::Base
  include ErrorHandling

  rescue_from ActionController::RoutingError, with: :notfound
  def notfound
    logger.error 'Routing error occurred'
    render file: 'public/404.html', status: :not_found, layout: false
  end
end
