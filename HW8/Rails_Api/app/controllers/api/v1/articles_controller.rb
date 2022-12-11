class Api::V1::ArticlesController < ApplicationController
  include Pagy::Backend
  skip_before_action :verify_authenticity_token
  before_action :set_article, only: [:show, :update, :update_status, :destroy]

  def index_all 
    @authors = Author.all
    @articles = Article.all
    @comments = Comment.all
    @tags = Tag.all
    @likes = Like.all
    render json: { authors: @authors, articles: @articles, comments: @comments, tags: @tags, likes: @likes}, status: :ok
  end

  # GET /api/v1/arricles?status=published
  # GET /api/v1/arricles?order=asc/desc
  # GET /api/v1/arricles?search_ph=iot (search_ph:title = first, search_ph:body = one, search_ph:tag = iot)
  # GET /api/v1/arricles?author=tom
  def index
    @articles = Article.all
    @articles = @articles.get_article_all
    @articles = @articles.status_position_article(params[:status]) if params[:status].present?
    @articles = Article.search_phrase(params[:search_ph]) if params[:search_ph].present?
    @articles = @articles.filter_by_author(params[:author]) if params[:author].present?
    @articles = @articles.sort_the_list_of_articles_by_title(params[:order]) if params[:order].present?

    @pagy, @articles = pagy(@articles, items: 15)

    render json: {index_article: @articles}, status: :ok
  end

  # GET /api/v1/arricles/1?last=1
  def show
    @comment = @article.comments
    @comment = @article.comments.get_comment_limit(params[:last]) if params[:last].present?
    @tags = @article.tags.get_tags_all
    render json: @article, include: ['author', 'comments', 'comments.author'], status: :ok
  end

  def create
    @article = Article.new(article_params)
    if @article.save
      render json: {create_article: @article}, status: :created
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

  #GET /api/v1/articles/:id/update_status?status=published или unpublished
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

  private

  def set_article
    @article = Article.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:title, :body, :author_id, :status)
  end

  def article_params_status
    params.require(:article).permit(:status)
  end
end
