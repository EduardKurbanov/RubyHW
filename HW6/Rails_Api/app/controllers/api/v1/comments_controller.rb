class Api::V1::CommentsController < ApplicationController
  before_action :set_comment, only: [:update, :destroy]
  
  def index
#    @article = Article.find(params[:article_id])
#    @comments = @article.comment.all
    @comments = Comment.where(status: params[:status] || :unpublished)
    render json: @comments, status: :ok
  end
  
  def create
    @comment = Comment.new(comment_params)
    @comment.author_id = params[:author_id]
    @comment.article_id = params[:article_id]
    if @comment.save
      render json: @comment, status: :created
    else
      render json: {
        error: @comment.errors.full_messages
      }, status: :unprocessable_entity
    end
  end

  def update
    if @comment.update(comment_params)
      render json: @comment, status: :ok
    else
      render json: {
        error: @comment.errors.full_messages
      }, status: :unprocessable_entity
    end
  end

  def destroy
    if @comment.destroy
      render json: @comment, status: :no_content
    else
      render json: {
        error: @comment.errors.full_messages
      }, status: :unprocessable_entity
    end
  end

  private

  def set_comment
    @article = Article.find(params[:article_id])
    @comment = Comment.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:body, :status)
  end  
end
