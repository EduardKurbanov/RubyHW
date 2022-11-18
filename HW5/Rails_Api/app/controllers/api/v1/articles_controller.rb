class Api::V1::ArticlesController < ApplicationController
  def index
    @articles = Article.all            
    render json: @articles, status: :ok
  end

  def show
    @article = Article.find_by(id: params[:id])
    render json: @article
  end

  def create
    @article = Article.new(title: params[:title], body: params[:body])
    if @article.save
      render json: @article, status: :created
    else
      render json: @article.errors, status: :unprocessable_entity
    end
  end

  def update
    @article = Article.find_by(id: params[:id])
    if @article.update(title: params[:title], body: params[:body])
      render json: @article
    else
      render json: @article.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @article = Article.find_by(id: params[:id])
    if @article.destroy
      head(:ok)
    else
      head(:destory)
    end
  end
end
