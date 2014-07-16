class ApplicationController < ActionController::Base
  protect_from_forgery
  include SessionsCustomerHelper
  include SessionsRestaurantHelper

end
