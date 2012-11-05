class SessionsController < ApplicationController
	
	def new
	end

	def create
	  user = User.find_by_email(params[:session][:email].downcase)
	  if user && user.authenticate(params[:session][:password])
	  	flash[:success] = "Welcome again #{user.name}"
	  	sign_in user
	    redirect_to user
	  else
	    flash.now[:error] = "Invalid email//password combination"
	    render 'new'
	  end
	end

	def destroy
		sign_out user
		flash[:success] = "You have been correctly signed out"
		redirect_to root
	end
end
