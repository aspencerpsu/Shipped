class UsersController < ApplicationController

  def index
  	@user = User.new
  end

  def show
    @user = current_user
    @boats = User.find(current_user).boats
    @boat = Boat.where(user_id: @user.id).all
  end

  def create
  	@user = User.create(user_params)
  	if @user.save
  		session[:user_id] = @user.id 
  		flash[:notice] = "Hey you logged into ship"
  		redirect_to user_path(@user)
  	else
  		flash[:alert] = "you didn't sign up correctly!"
  		redirect_to '/'
  	end
  end

  def edit
    @user = current_user
    @user.new
  end

  def update
  end

  def destroy
    @user = current_user
    if @user
      @user.delete
      flash[:notice] = "You successfully deleted your account"
      redirect_to root_path
    else
      flash[:notice] = "Couldn't delete this account"
    end
  end

	private

	def user_params
		params.require(:user).permit(:name, :email, :password, :password_confirmation, :avatar)
	end
end

