class ReviewsController < ApplicationController
  before_action :require_login, except: %i[index]

  def index
    field = Field.find(params[:field_id])
    @reviews = field.reviews
    render json: @reviews
  end

  def show
    field = Field.find(params[:field_id])
    @review = field.reviews
    render json: @review
  end

  def create
    @review = Review.new(review_params)
    @review.user_id = current_user.id
    @review.field_id = params[:field_id]

    if @review.save
      render json: @review
    else
      render json: @review.errors, status: :unprocessable_entity
    end
  end

  def edit
    @review = Review.find(params[:id])
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    head :no_content
  end

  # def update
  #   @review = Review.find(params[:id])
  #   @review.user = current_user
  #   @review.update(review_params)
  # end

  private

  def review_params
    params.require(:review).permit(:comment, :rating)
  end
end
