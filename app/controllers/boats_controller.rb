class BoatsController < ApplicationController
  def new
    @user = current_user
    @boat = Boat.new
  end

  def create
    @user = current_user
    @boat = Boat.create(boat_params)
    if @boat.save
      flash[:notice] = "Successful boat saved and made"
      redirect_to user_path @user
    else
      flash[:alert] = "Try and save the boat again"
      redirect_to root_path
    end
  end

  def index
    @boats = Boat.all
  end

  def edit
    @user = current_user
    @boat = Boat.find(params[:id])
  end

  def update
    @user = current_user
    @boat = Boat.find(params[:id])
    @boat.update(boat_params)
    @boat.save
    redirect_to user_path
  end

  def show
  end

  def destroy
    @boat = Boat.find(params[:id])
    if @boat.delete
      redirect_to user_path
    else
    end
  end

  private
  def boat_params
    params.require(:boat).permit(:name, :location, :capacity).merge(user_id: current_user.id)
  end
end


