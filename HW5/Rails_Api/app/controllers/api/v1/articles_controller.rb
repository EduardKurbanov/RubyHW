class Api::V1::ArticlesController < ApplicationController
  def index
    @articles = Article.all
    render json: @articles, status: :ok
  end

  def show
    @article = Article.find_by(id: set_article)
    render json: @article
  end

  def create
    @article = Article.new(title: article_params[:title], body: article_params[:title])
    if @article.save
      render json: @article, status: :created
    else
      render json: @article.errors, status: :unprocessable_entity
    end
  end

  def update
    @article = Article.find_by(id: set_article)
    if @article.update(title: article_params[:title], body: article_params[:title])
      render json: @article
    else
      render json: @article.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @article = Article.find_by(id: set_article)
    if @article.destroy
      head(:ok)
    else
      head(:destory)
    end
  end

  private

  def set_article
    @article = Article.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:title, :body)
  end
end
