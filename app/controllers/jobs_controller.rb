class JobsController < ApplicationController
  def new
    @user = current_user
  	@boat = Boat.find(params[:boat_id])
  	@job = @boat.jobs.build
  end

  def create
    @user = current_user
    @boat = Boat.find(params[:boat_id])
    @job = @boat.jobs.build(job_params)

    if check_back_location(@job, params[:destination])
      @job.save
      flash[:notice] = "Moved the boat successfully"
      redirect_to user_path(@user)
    else
      redirect_to :back
    end
  end

  def show
    @boat = Boat.find_by(id: params[:boat_id])
    @job = @boat.jobs.find_by(id: params[:job_id])
  end

  def destroy
    @user = current_user
    @boat = Boat.find(params[:boat_id])
    @job = @boat.jobs.find_by(id: params[:job_id])
    if @job
      @job.delete
      flash[:notice] = "Successfully deleted this job"
      redirect_to @user
    end
  end

  private
  def job_params
  	params.require(:job).permit(:price, :name, :cargo, :containers, :destination)
  end
end
