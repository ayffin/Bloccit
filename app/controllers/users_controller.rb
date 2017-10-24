class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)


    if @user.save
      flash[:notice] = "Welcome to Bloccit #{@user.name}!"
      flash[:color]= "valid"
      redirect_to root_path
    else
      flash.now[:alert] = "There was an error creating your account. Please try again."
       flash[:color]= "invalid"
      render :new
    end
  end

  def confirm
    @user = User.new(user_params)
    # render :new if @user.invalid?
  end

  private
  def user_params
      params.require(:user).permit(:name, :email, :password,
                                   :password_confirmation)
    end
end
