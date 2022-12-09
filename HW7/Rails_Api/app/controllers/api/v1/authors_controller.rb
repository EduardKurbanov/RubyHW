class Api::V1::AuthorsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    @author = Author.all
    render json: {author_index: @author}, status: :ok
  end

  def create
    @author = Author.new(author_params)
    if @author.save
      render json: {author_create: @author}, status: :created
    else
      render json: {
        error: {error: @author.errors.full_messages}
      }, status: :unprocessable_entity
    end
  end

  def destroy
    @author = Author.find(params[:id])
    if @author.destroy
      render json: {destroy_author: @author}, status: :no_content
    else
      render json: @author, status: :unprocessible_entity
    end
  end

  def author_params
    params.require(:author).permit(:name)
  end
end
