# app/controllers/users_controller.rb

class UsersController < ApplicationController
  def new
  end

  def create
    user = User.new(user_params)
    if User.exists?(email: user_params["email"])
      redirect_to '/signup', flash: {error: "Email already exists!"}
    elsif user.password.length() < 8
      redirect_to '/signup', flash: {error: "Password not long enough!"}
    elsif user.password != user.password_confirmation
      redirect_to '/signup', flash: {error: "Passwords do not match!"}
    elsif user.save
      session[:user_id] = user.id
      redirect_to '/'
    else
      redirect_to '/signup'
    end
  end

  private
  
  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end
   
end