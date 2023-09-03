class SessionsController < ApplicationController

  def new
  end

  def create
    @user = User.find_by_email(params[:email])
    if @user && @user.authenticate(params[:password])
      log_in @user
      flash[:notice] = "Logged in successfully"
      redirect_to root_path
    else
      flash[:alert] = "Email and password not match"
      render :new
    end
  end

  def destory
    log_out
    flash[:alert] = "Logged out successfully"
    redirect_to login_path 
  end
end
