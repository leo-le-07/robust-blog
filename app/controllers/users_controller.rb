class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to root_path
    else
      flash[:notice] = @user.errors.full_messages.to_sentence
      render 'new'
    end
  end

  private
    def user_params
      params.require(:user).permit(:email, :name, :password)
    end
end
