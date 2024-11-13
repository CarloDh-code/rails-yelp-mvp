class ReviewsController < ApplicationController


def index
  @reviews = Review.all
end

def new
  @restaurant = Restaurant.find(params[:restaurant_id])
  @review = Review.new
end

def create
  @review = Review.new(review_params)
  @restaurant = Restaurant.find(params[:restaurant_id])
  @review.restaurant = Restaurant.find(params[:restaurant_id]) # revient à faire review.restaurant_id = @restaurant.id
    if @review.save
      redirect_to restaurant_path(@restaurant)
    else
      render :new, status: :unprocessable_entity
    end
end

  private

  def review_params
    params.require(:review).permit(:content, :rating)
  end
end
