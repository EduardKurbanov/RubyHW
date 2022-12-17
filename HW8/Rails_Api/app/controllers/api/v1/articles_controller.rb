class Api::V1::ArticlesController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :set_article, only: %i[show update update_status destroy]

  # GET /api/v1/arricles?status=published
  # GET /api/v1/arricles?order=asc/desc
  # GET /api/v1/arricles?search_ph=iot (search_ph:title = first, search_ph:body = one)
  # GET /api/v1/arricles?author=tom
  # GET /api/v1/articles?search_tag=iot&rails
  def index
    @articles = Article.all
    @articles = @articles.get_article_all
    @articles = @articles.status_position_article(params[:status]) if params[:status].present?
    @articles = Article.search_for_a_phrase_in_an_article(params[:search_ph]) if params[:search_ph].present?
    @articles = @articles.filter_by_author(params[:author]) if params[:author].present?
    @articles = @articles.sort_the_list_of_articles_by_title(params[:order]) if params[:order].present?
    @articles = @articles.search_tag(params[:search_tag]) if params[:search_tag].present?

    @pagy, @articles = pagy(@articles, page: params[:page], items: 15)

    render json: @articles, status: :ok
  end

  # GET /api/v1/arricles/1?last=1
  def show
    render json: @article, each_serializer: Api::V1::ArticleSerializer, status: :ok
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
    params.require(:article).permit(:title, :body, :author_id, :status, :all_tags)
  end

  def article_params_status
    params.require(:article).permit(:status)
  end
end
