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
      render projects_path(@project)
  end

  def update
  end

  def edit
  end

  def destroy
  end

  private
  def project_params
  end

end
