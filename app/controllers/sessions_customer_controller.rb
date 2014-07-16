class SessionsCustomerController < ApplicationController
	def new
	end

	def create
	  customer = Customer.find_by_email(params[:sessions_customer][:email].downcase)
      if customer && customer.authenticate(params[:sessions_customer][:password])
        customersign_in customer
        redirect_to customer
        # Sign the user in and redirect to the user's show page.
      else
        flash.now[:error] = 'Invalid email/password combination' # Not quite right!
        render 'new'
      end
	end

	def destroy
		customersign_out
		redirect_to root_url
	end
end
