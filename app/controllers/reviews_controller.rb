class ReviewsController < ApplicationController
  def index
    @reviews = Review.all
    render json: @reviews
  end

  def show
    @review = Review.find(params[:id])
    render json: @review
  end

  def create
    @review = Review.new(review_params)
    if @review.save
      render json: @review
    else
      render json: @review.errors, status: :unprocessable_entity
    end
  end

  def edit
    @review = Review.find(params[:id])
    authorize @review
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    authorize @review
  end

  # def update
  #   @review = Review.find(params[:id])
  #   @review.user = current_user
  #   @review.update(review_params)
  # end

  private

  def review_params
    params.require(:review).permit(:comment, :user_id, :rating, :field_id)
  end
end
