class PledgesController < ApplicationController

  def index
    @pledges = Pledge.all
  end

  def show
    @project = Project.find(params[:project_id])
    @pledge = Pledge.find(params[:id])
  end

  def new
    @project = Project.find(params[:project_id])
    @pledge = Pledge.new
  end

  def create
    @project = Project.find(params[:project_id])
    @pledge = Pledge.new(pledge_params)

    if @pledge.save
      redirect_to project_pledge_path, notice: "Pledge successfully submitted!"
    else
      render :new
    end
  end

  def update
  end

  def edit
  end

  def destroy
  end

  private
  def pledge_params
    params.require(:pledge).permit(:amount)
  end
end
