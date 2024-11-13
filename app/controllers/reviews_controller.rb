class ReviewsController < ApplicationController


def index
  @reviews = Review.all
end

def new
  @restaurant = Restaurant.find(params[:restaurant_id])
  @review = Review.new
end

def create
  @restaurant = Restaurant.find(params[:restaurant_id])
  @review = Review.new(review_params)
  @review.restaurant = Restaurant.find(params[:restaurant_id]) # revient à faire review.restaurant_id = @restaurant.id
    if @review.save
      redirect_to @restaurant, notice: 'Review was successfully created.'
    else
      render 'restaurants/show', status: :unprocessable_entity
    end
end

  private

  def review_params
    params.require(:review).permit(:content, :rating)
  end
end
