class SessionsController < ApplicationController

  def new
  end

  def create
    username = params[:username]
    password = params[:password]
    password_comfirm = params[:password_comfirmation]

    user = User.find_by username: username
    if user && user.authenticate(password)
      session[:user_id] = user.id
      redirect_to root_path, notice: "You have successfully logged in"
    else
      flash.now[:alert] = "Username and Password do not match"
      render :new
    end
  end

  def delete
    session.delete :user_id
    redirect_to root_path, notice: "You are now logged out"
  end
end
