class Api::V1::AuthorsController < ApplicationController
  before_action :set_author, only: %i[show update destroy]

  # GET /api/v1/authors
  def index
    @authors = Author.all

    render json: @authors
  end

  # GET /api/v1/authors/1
  def show
    render json: @author
  end

  # POST /api/v1/authors
  def create
    @author = Author.new(author_params)

    if @author.save
      render json: { status: "Create", data: @author }, status: :created, location: @author
    else
      render json: @author.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /api/v1/authors/1
  def update
    if @author.update(author_params)
      render json: { status: "Update", data: @author }, status: :ok
    else
      render json: @author.errors, status: :unprocessable_entity
    end
  end

  # DELETE /api/v1/authors/1
  def destroy
    if @author.destroy
      render json: { status: "Delete" }, status: :ok
    else
      render json: @article.errors, status: :unprocessable_entity
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_author
      @author = Author.find(params[:id])
      render json: @author
    rescue ActiveRecord::RecordNotFound => e
      logger.info e
      return render json: { message: 'author id not found' }, status: :not_found
    end

    # Only allow a list of trusted parameters through.
    def author_params
      params.require(:author).permit(:name)
    end
end
