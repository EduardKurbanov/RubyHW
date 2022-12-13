class Api::V1::TagsController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :set_tag, only: %i[show update destroy]

  def index
    @tags = Tag.all
    render json: {tag_index: @tags}, status: :ok
  end
  
  def create
    @tag = Tag.new(tag_params)
    if @tag.save
      render json: {tag_create: @tag}, status: :created
    else
      render json: {
        error: @tag.errors.full_messages
      }, status: :unprocessable_entity
    end
  end

  def show
    @articles_tag = @tag.articles.get_articles_all
    render json: { tag: @tag, article: @articles_tag }, status: :ok
  end

  def update
    @tag = Tag.find(params[:id])
    if @tag.update(tag_params)
      render json: {tag_update: @tag}, status: :ok
    else
      render json: {
        error: @tag.errors.full_messages
      }, status: :unprocessable_entity
    end
  end
  
  def destroy
    @tag = Tag.find(params[:id])
    if @tag.destroy
      render json: {tag_gestroy: @tag}, status: :created
    else
      render json: {
        error: @tag.errors.full_messages
      }, status: :unprocessable_entity
    end
  end 

  private

  def set_tag
    @tag = Tag.find(params[:id])
  end

  def tag_params
    params.require(:tag).permit(:title)
  end
end
