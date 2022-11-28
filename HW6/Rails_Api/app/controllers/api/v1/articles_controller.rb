class Api::V1::ArticlesController < ApplicationController
  before_action :set_author_article, only: [:update, :destroy]

  def index_all 
    @authors = Author.all
    @articles = Article.all
    @comments = Comment.all
    render json: { authors: @authors, articles: @articles, comments: @comments}, status: :ok
  end

  def index
    @author = Author.find(params[:author_id])
    @articles = @author.articles.all
    render json: @articles, status: :ok
  end

  def show
    @author = Author.find(params[:author_id])
    @article = @author.articles.find(params[:id])
    render json: {article: @article, comment: @article.comment}, status: :ok
  end

  def create
    @article = Article.new(article_params)
    @article.author_id = params[:author_id]
    if @article.save
      render json: @article, status: :created
    else
      render json: @article.errors, status: :unprocessable_entity
    end
  end

  def update
    if @article.update(article_params)
      render json: @article, status: :ok
    else
      render json: @article.errors, status: :unprocessable_entity
    end
  end

  def destroy
    if @article.destroy
      render json: @article, status: :no_content
    else
      render json: @article, status: :unprocessible_entity
    end
  end

  private

  def set_author_article
    @author = Author.find(params[:author_id])
    @article = @author.articles.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:title, :body)
  end
end
