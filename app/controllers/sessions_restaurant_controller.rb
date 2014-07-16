class SessionsRestaurantController < ApplicationController
  def new
  end

  def create
	restaurant = Restaurant.find_by_email(params[:sessions_restaurant][:email].downcase)
    if restaurant && restaurant.authenticate(params[:sessions_restaurant][:password])
      restaurantsign_in restaurant
      redirect_to restaurant
    # Sign the user in and redirect to the user's show page.
    else
      flash.now[:error] = 'Invalid email/password combination' # Not quite right!
      render 'new'
    end
  end

  def destroy
	restaurantsign_out
	redirect_to root_url
  end
end
