module SessionsRestaurantHelper
  def restaurantsign_in(restaurant)
	  cookies.permanent[:remember_token] = restaurant.remember_token
	  self.current_restaurant = restaurant
  end

  def current_restaurant=(restaurant)
    @current_restaurant = restaurant
  end

  def current_restaurant
    Restaurant.find_by_remember_token(cookies[:remember_token])
  end

  def restaurantsigned_in?
    current_restaurant.present?
  end

  def restaurantsign_out
    self.current_restaurant = nil
    cookies.delete(:remember_token)
  end

  def current_restaurant?(restaurant)
    restaurant == current_restaurant
  end

  def signed_in_restaurant
    unless restaurantsigned_in?
      redirect_to root_url
      flash[:error] = "Please sign in."
    end
  end

  def signed_in_user
    unless restaurantsigned_in? or customersigned_in?
      redirect_to root_url
      flash[:error] = "Please sign in."
    end
  end

end
