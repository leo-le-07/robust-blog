class SessionsController < ApplicationController
  def new
  end

  def create
    user = UserLogin.new.login(params[:email], params[:password])
    if user
      session[:user_id] = user.id
      flash[:success] = "Welcome back !"
      redirect_to root_path
    else
      flash.now[:notice] = "Email or password is incorrect"
      render 'new'
    end
  end

  def index
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end
end
