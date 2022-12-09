class Api::V1::CommentsController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :set_comment, only: [:update, :destroy]
  
  # GET /api/v1/comments?status=published
  def index
    @comments = Comment.all
    @comments = @comments.where(status: params[:status]) if params[:status]
    render json: {comment_idex: @comments}, status: :ok
  end
  
  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      render json: {comment_create: @comment}, status: :created
    else
      render json: {
        error: @comment.errors.full_messages
      }, status: :unprocessable_entity
    end
  end

  def update
    if @comment.update(comment_params)
      render json: {comment_update: @comment}, status: :ok
    else
      render json: {
        error: @comment.errors.full_messages
      }, status: :unprocessable_entity
    end
  end

  def update_starus
    if @comment.update(comment_params_starus)
      render json: {comment_update_status: @comment}, status: :ok
    else
      render json: {
        error: @comment.errors.full_messages
      }, status: :unprocessable_entity
    end
  end

  def destroy
    if @comment.destroy
      render json: {comment_destroy: @comment}, status: :no_content
    else
      render json: {
        error: @comment.errors.full_messages
      }, status: :unprocessable_entity
    end
  end

  private

  def set_comment
    @comment = Comment.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:body, :status, :author_id, :article_id)
  end

  def comment_params_starus
    params.require(:comment).permit(:status)
  end    
end
