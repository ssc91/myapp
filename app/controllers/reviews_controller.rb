class ReviewsController < ApplicationController
  
  def index
  end

  def create
    @review = current_customer.reviews.build(params[:review])
    @restaurant = Restaurant.find(params[:review][:restaurant_id])
    if @review.save
      flash[:success] = "Review posted!"
      redirect_to @restaurant
    else
      flash[:error] = "Oops !! Something went wrong. Please try again later."
      redirect_to @restaurant
    end
  end

  def destroy
    review = Review.find_by_id(params[:id])
    @restaurant = Restaurant.find_by_id(review.restaurant_id)
    if !review.nil?
      if !(current_customer.id == review.user_id)
         redirect_to @restaurant, notice: 'you are not authorized to perform this action'
      else
        review.destroy
        redirect_to @restaurant
      end
    else
      flash[:error] = "Oops !! Something went wrong. Please try again later."
      redirect_to @restaurant
    end
  end
  
end
