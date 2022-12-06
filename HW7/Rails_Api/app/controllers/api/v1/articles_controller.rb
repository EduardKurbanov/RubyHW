class Api::V1::ArticlesController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :set_article, only: [:show, :update, :destroy]

  def index_all 
    @authors = Author.all
    @articles = Article.all
    @comments = Comment.all
    @tags = Tag.all
    render json: { authors: @authors, articles: @articles, comments: @comments, tags: @tags}, status: :ok
  end

  def index
    @articles = Article.all
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
    params.require(:article).permit(:title, :body, :author_id, :status)
  end
end
