class Api::V1::ArticlesController < ApplicationController
  before_action :set_article, only: %i[show update destroy]

  def index
    @articles = Article.all
    render json: {index_articles: @articles}, status: :ok
  end

  def show
    @comments = @article.comment
    render json: {article: @article, comment: @comments}, status: :ok
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
    params.require(:article).permit(:title, :body, :author_id)
  end
end
