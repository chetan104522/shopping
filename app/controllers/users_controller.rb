class UsersController < ApplicationController
  
  def new
    @user = User.new
  end

  def create
    user = User.new(user_params)
    if user.save
      log_in user
      flash[:notice] = "User created sccessfully"
      redirect_to root_path
    else
      flash[:alert] = "Pleased provide right credentials"
      render :new
    end
  end

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end
