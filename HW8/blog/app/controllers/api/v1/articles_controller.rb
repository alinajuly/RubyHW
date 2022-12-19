class Api::V1::ArticlesController < ApplicationController
  include Pagy::Backend
  before_action :set_article, only: %i[show update destroy]

  # GET /api/v1/articles
  def index
    @articles = Article.all
  # GET /api/v1/articles?search_phrase
    @articles = @articles.search_by_phrase(params[:search_phrase]) if params[:search_phrase].present?
  # GET /api/v1/articles?status
    @articles = @articles.filter_by_status(params[:status]) if params[:status].present?
  # GET /api/v1/articles?author
    @articles = @articles.filter_by_author_name(params[:author]) if params[:author].present?
  # GET /api/v1/articles
    @articles = @articles.filter_by_tag(params[:tags].map(&:downcase)) if params[:tags].present?
  # GET /api/v1/articles?order
    @articles = @articles.sort_by_order(params[:order]) if params[:order].present?

    @pagy, @articles = pagy(@articles, items: 15)

    render json: @articles, each_serializer: Api::V1::ArticlesSerializer
  end

  # GET /api/v1/articles/1
  def show
    @comments = @article.comments.last_ten_comments

    render json: @article, each_serializer: Api::V1::ArticleSerializer, status: :ok
  end

  # POST /api/v1/articles
  def create
    @article = Article.new(article_params)
    
    if @article.save
      render json: { status: "Create", data: @article }, status: :created
    else
      render json: @article.errors, status: :unprocessable_entity
    end
  end

  # PUT/PATCH /api/v1/articles/1
  def update
    if @article.update(article_params)
      render json: { status: "Update", data: @article }, status: :ok
    else
      render json: @article.errors, status: :unprocessable_entity
    end
  end

  # DELETE /api/v1/articles/1
  def destroy
    if @article.destroy
      render json: { status: "Delete" }, status: :ok
    else
      render json: @article.errors, status: :unprocessable_entity
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_article
    @article = Article.find(params[:id])
    render json: @article
  rescue ActiveRecord::RecordNotFound => e
    logger.info e
    return render json: { message: 'article id not found' }, status: :not_found
  end

  # Only allow a trusted parameter through.
  def article_params
    params.require(:article).permit(:title, :body, :author_id, :status)
  end
end
