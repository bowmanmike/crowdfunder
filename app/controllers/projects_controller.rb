class ProjectsController < ApplicationController

  def index
    @projects = Project.all
  end

  def show
    @project = Project.find(params[:id])
  end

  def new
    @project = Project.new
    @project.rewards.build
  end

  def create
    @project = Project.create(project_params)
    @project.owner = current_user

    if @project.save
      flash[:notice] = "Project successfully created!"
      redirect_to project_path(@project)
    else
      render :new
    end
  end

  def edit
    @project = Project.find(params[:id])
  end

  def update
    @project = Project.find(params[:id])

    if params[:project][:tags]
      @tag = Tag.find(params[:project][:tags])
      @project.tags << @tag unless @project.tags.include?(@tag)
      redirect_to project_path(@project)
      return
    end

    if @project.update_attributes(project_params)
      flash[:notice] = "Project successfully edited."
      redirect_to project_path(@project)
    else
      render :edit
    end
  end

  def destroy
    @project = Project.find(params[:id])
    @project.destroy
    flash[:notice] = "Project successfully deleted."
    redirect_to projects_path
  end

  private
  def project_params
    params.require(:project).permit(:name, :end_date, :funding_goal, :description, rewards_attributes: [:name, :price, :description, :number_available, :project_id, :_destroy])
  end

end
