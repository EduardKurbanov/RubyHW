class Api::V1::AuthorsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    @author = Author.all
    render json: @author, status: :ok
  end

  def create
    @author = Author.new(author_params)
    if @author.save
      render json: @author, status: :created
    else
      render json: {
        error: @author.errors.full_messages
      }, status: 442
    end
  end

  def author_params
    params.require(:author).permit(:name)
  end
end
