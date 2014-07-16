class ReviewsController < ApplicationController
  
  def index
    if customersigned_in?
      @reviews_customer = Review.find_all_by_user_id(current_customer.id)
    elsif restaurantsigned_in?
      @reviews_restaurant = Review.find_all_by_restaurant_id(current_restaurant.id)
    end
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
        flash[:error] = "you are not authorized to perform this action"
        redirect_to @restaurant#, notice: 'you are not authorized to perform this action'
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
