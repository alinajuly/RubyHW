class Api::V1::CommentsController < ApplicationController
  before_action :set_comment, only: %i[update destroy]

  # GET /api/v1/comments
  def index
    render json: comments
  end

  # POST /api/v1/comments
  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      rrender json: { status: "Create", data: @comment }, status: :created
    else 
      render json: @comment.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /api/v1/comments/1
  def update
    if @comment.update(comment_params)
      render json: { status: "Update", data: @comment }, status: :ok
    else
      render json: @comment.errors, status: :unprocessable_entity
    end
  end

  # DELETE /api/v1/comments/1
  def destroy
    if @comment.destroy
      render json: { status: "Delete" }, status: :ok
    else
      render json: @article.errors, status: :unprocessable_entity
    end
  end

  private
  
  def comments 
    return Comment.with_status(params[:status]) if params[:status].present?
    
    Comment.all
  end

  def set_comment
    @comment = Comment.find(params[:id])
  rescue ActiveRecord::RecordNotFound => e
    logger.info e
    return render json: { message: 'comment id not found' }, status: :not_found
  end

  def comment_params
    params.require(:comment).permit(:body, :status, :author_id, :article_id)
  end
end
