class ProjectsController < ApplicationController

  def index
    @projects = Project.all
  end

  def show
    @project = Project.find(params[:id])
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.create(project_params)
    # no current_user method yet, temporarily setting
    # all new projects to owner_id = 3
    # @project.owner = current_user
    @project.owner_id = 3

    if @project.save
      redirect_to project_path(@project)
    else
      render :new
    end
  end

  def edit
    @project = Project.find(params[:id])
  end

  def update
    
  end

  def destroy
  end

  private
  def project_params
    params.require(:project).permit(:name, :end_date, :funding_goal, :description)
  end

end
