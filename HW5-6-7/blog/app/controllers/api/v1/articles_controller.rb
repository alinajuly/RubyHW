class Api::V1::ArticlesController < ApplicationController
  before_action :set_article, only: %i[ show show_last_10_comments update destroy ]

  # GET /api/v1/articles
  def index
    @articles = Article.all
    
    render json: @articles
  end

  # GET /api/v1/articles/1
  def show
    @comments = @article.comments.last_ten_comments
    render json: { article: @article, comments: @comments }, status: :ok
  end

  # POST /api/v1/articles
  def create
    @article = Article.new(article_params)
    
    if @article.save
      render json: @article, status: :created
    else
      render json: @article.errors, status: :unprocessable_entity
    end
  end

  # PUT/PATCH /api/v1/articles/1
  def update
    if @article.update(article_params)
      render json: @article, status: :ok
    else
      render json: @article.errors, status: :unprocessable_entity
    end
  end

  # DELETE /api/v1/articles/1
  def destroy
    if @article.destroy
      render status: :ok
    else
      render json: @article.errors, status: :unprocessable_entity
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  
  # def get_comments
  #   if params[:show_last_ten_comments]
  #     Article.last_ten_comments(@article)
  #   else
  #     @article.comments
  #   end
  # end
  
  def set_article
    @article = Article.find(params[:id])
  end

  # Only allow a trusted parameter through.
  def article_params
    params.require(:article).permit(:title, :body)
  end
end
