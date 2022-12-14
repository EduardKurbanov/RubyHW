class Api::V1::ArticlesController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :set_article, only: %i[show update update_status destroy]

  # GET /api/v1/arricles?status=published
  def index
    @articles = Article.all
    @articles = @articles.where(status: params[:status]) if params[:status]
    render json: {index_article: @articles}, status: :ok
  end

  def show
    @comments = @article.comment.get_comments_all.last(10)
    @tags = @article.tags.get_tags_all
    render json: {article: @article, comment: @comments, tag: @tags}, status: :ok
  end

  def create
    @article = Article.new(article_params)
    if @article.save
      render json: {create_article: @article, tags: @article.tags}, status: :created
    else
      render json: @article.errors, status: :unprocessable_entity
    end
  end

  def update
    if @article.update(article_params)
      render json: {update_article: @article}, status: :ok
    else
      render json: @article.errors, status: :unprocessable_entity
    end
  end

  def update_status
    if @article.update(article_params_status)
      render json: {update_article_status: @article}, status: :ok
    else
      render json: @article.errors, status: :unprocessable_entity
    end
  end

  def destroy
    if @article.destroy
      render json: {destroy_article: @article}, status: :no_content
    else
      render json: @article, status: :unprocessible_entity
    end
  end
  
  def tag_add 
    @article = Article.find(params[:id])
    @article.all_tags=(params[:tag])
    render json: { article: @article, tags: @article.tags }, status: :created
  end

  private

  def set_article
    @article = Article.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:title, :body, :author_id, :status, :all_tegs)
  end

  def article_params_status
    params.require(:article).permit(:status)
  end
end
