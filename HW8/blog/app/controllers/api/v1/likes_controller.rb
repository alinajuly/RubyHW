class Api::V1::LikesController < ApplicationController
  before_action :set_like, only: %i[ show update destroy ]

  # GET /api/v1/likes
  def index
    @likes = Like.all

    render json: @likes
  end

  # GET /api/v1/likes/1
  def show
    render json: @like
  end

  # POST /api/v1/likes
  def create
    @like = Like.new(like_params)
    if @like.save
      render json: { status: "Create", data: @like }, status: :created
    else
      render json: @like.errors, status: :unprocessable_entity
    end
  end

  # DELETE /api/v1/likes/1
  def destroy
    render json: { status: "Delete" }, status: :ok
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_like
      @like = Like.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def like_params
      params.require(:like).permit(:likeable_type, :likeable_id)
    end
end
