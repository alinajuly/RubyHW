class Api::V1::CommentsController < ApplicationController
  before_action :set_comment, only: %i[ update destroy ]

  def index
    if Comment.statuses.keys.include?(params[:status])
      render json: Comment.with_status(params[:status])
    else
      render json: Comment.all 
    end
  end

  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      render json: @comment, status: :created, location: @comment 
    else 
      render json: @comment.errors, status: :unprocessable_entity
    end
  end

  def update
    if @comment.update(comment_params)
      render json: @comment 
    else
      render json: @comment.errors, status: :unprocessable_entity
    end
  end

  private
  
  def set_comment
    @comment = Comment.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:body, :status, :author_id, :article_id)
  end
end
