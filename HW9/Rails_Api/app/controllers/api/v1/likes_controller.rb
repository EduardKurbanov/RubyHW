class Api::V1::LikesController < ApplicationController
  skip_before_action :verify_authenticity_token

  def create
    if params[:article_id].present?
      @article = Article.find(params[:article_id])
      @article_like = @article.likes.create(like_params)
      @article_like.save
      render json: {new_like: @article_like}, status: :ok
    else
      @comment = Comment.find(params[:comment_id])
      @comment_like = @comment.likes.create(like_params)
      @comment_like.save
      render json: {new_like: @comment_like}, status: :ok
    end
  end

  def destroy
    @like = Like.find(params[:id])
    if @like.destroy
      render json: { message: 'del like' }
    else
      render json: {
        error: @like.errors.full_messages
      }, status: :unprocessable_entity
    end
  end
  
  private

  def like_params
    params.require(:like).permit(:author_id)
  end 
end