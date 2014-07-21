class RatingsController < ApplicationController

  def create
  	@restaurant = Restaurant.find(params[:rating][:restaurant_id])
  	@rating = current_customer.ratings.build(params[:rating])
  	@rating.save
    redirect_to @restaurant
  end

  def update
  	@restaurant = Restaurant.find(params[:rating][:restaurant_id])
  	@rating = current_customer.ratings.find_by_restaurant_id(params[:rating][:restaurant_id])
    @rating.update_attributes(user_rating: params[:rating][:user_rating].to_i)
    @rating.save
    redirect_to @restaurant
  end

end