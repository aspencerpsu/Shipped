class SessionsController < ApplicationController
  def index
  	@user = User.new
  end

  def create
  	@user = User.where(email: params[:email]).first
  	if @user && @user.authenticate(params[:password])
  		session[:user_id] = @user.id 
  		flash[:notice] = "Hey you logged into ship"
  		redirect_to user_path(@user)
  	else
  		flash[:alert] = "you didn't login correctly!"
  		redirect_to '/'
  	end
  end

   def destroy
    @user = User.where(params[:id]).first 
    if @user
      session[:user_id] = nil
      flash[:notice] = "you've been logged out successfully!"
      redirect_to root_path
    else
      flash[:alert] = "We had a difficult time logging you out"
    end
  end
end
