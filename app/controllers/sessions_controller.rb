class SessionsController < ApplicationController
  def new
  end

  def destroy
      log_out if logged_in?
      redirect_to root_path
  end

  def create
  	user = User.find_by(email: params[:session][:email].downcase)
  	if user && user.authenticate(params[:session][:password])
          log_in user
          flash[:success] = "Login success"
          params[:session][:remember_me] == '1' ? remember(user) : forget(user)
          redirect_to user		 		
  	else
  	      flash.now[:danger] = 'Invalid Input'
  	      render 'new'
  	end
  end
end
