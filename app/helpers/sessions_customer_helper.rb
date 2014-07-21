module SessionsCustomerHelper

  def customersign_in(customer)
	  cookies.permanent[:remember_token] = customer.remember_token
	  self.current_customer = customer
  end

  def current_customer=(customer)
    @current_customer = customer
  end

  def current_customer
    Customer.find_by_remember_token(cookies[:remember_token])
  end

  def customersigned_in?
    current_customer.present?
  end

  def customersign_out
    self.current_customer = nil
    cookies.delete(:remember_token)
  end

  def current_customer?(customer)
    customer == current_customer
  end

  def signed_in_customer
    unless customersigned_in?
      redirect_to root_url
      flash[:error] = "Please sign in."
    end
  end

  def signed_in_user
    unless (restaurantsigned_in? || customersigned_in?)
      redirect_to root_url
      flash[:error] = "Please sign in."
    end
  end
end