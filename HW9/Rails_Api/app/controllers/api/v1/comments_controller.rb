class Api::V1::CommentsController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :set_comment, only: %i[update update_status destroy]
  
  # GET /api/v1/comments?status=published
  # GET /api/v1/comments?last=1
  def index
    @comments = Comment.all
#    @comments = @comments.get_all_by_sort_desc
    @comments = @comments.status_position_comment(params[:status]) if params[:status].present?
    @comments = @comments.get_comment_limit(params[:last]) if params[:last].present?
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

  #GET /api/v1/comments/:id/update_status?status=published или unpublished
  def update_status
    if @comment.update(comment_params_status)
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

  def comment_params_status
    params.permit(:status)
  end
end
