class Api::V1::LikesController < ApplicationController
  skip_before_action :verify_authenticity_token

  def create
    if params[:article_id].present?
      @article = Article.find(params[:article_id])
      @like_article = @article.likes.create(like_params)
      render json: @like_article, status: :ok
    else
      @comment = Comment.find(params[:comment_id])
      @like_comment = @comment.likes.create(like_params)
      render json: @like_comment, status: :ok
    end
  end

  def destroy
    @like = Like.find(params[:id])
    @like.destroy
    render json: { message: 'Unliked' }
  end
  
  private

  def like_params
    params.require(:like).permit(:author_id)
  end
    
end
