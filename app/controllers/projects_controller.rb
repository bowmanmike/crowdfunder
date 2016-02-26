class ProjectsController < ApplicationController


  def index
    @pledges = Pledge.all

    if params[:proj_search] == nil && params[:tag_search] == nil
      @projects = Project.all
      @tags = Tag.all
    elsif params[:proj_search]
      @projects = Project.where("LOWER(name) LIKE LOWER(?)", "#{params[:proj_search]}%")
      @tags = []
      @projects.each do |project|
        project.tags.each { |tag| @tags << tag unless @tags.include?(tag) }
      end
    elsif params[:tag_search]
      @tags = Tag.where("LOWER(name) LIKE LOWER(?)", "#{params[:tag_search]}%")
      @projects = []
      @tags.each do |tag|
        tag.projects.each { |project| @projects << project unless @projects.include?(project) }
      end
    end

    respond_to do |format|
      format.html
      format.js
    end
  end

  def show
    @project = Project.find(params[:id])
    @tags = @project.tags.order(name: :asc)

    if @project.pledges.find_by(backer_id: current_user)
      puts params
      @pledge = @project.pledges.find_by(backer_id: current_user)
    else
      @pledge = Pledge.new
    end

    if current_user
      @comment = Comment.new
    end

    respond_to do |format|
      format.html
      format.js
    end


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
    @tags = @project.tags.order(name: :asc)

    if params[:tag]
      @project.tags.delete(params[:tag])
      return
    end

    if params[:project][:tags]
      @tag = Tag.find(params[:project][:tags])
      @project.add_tag(@tag)
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
    params.require(:project).permit(:name, :end_date, :funding_goal, :description, :feature_image, rewards_attributes:
        [:name, :price, :description, :number_available, :project_id, :_destroy])
  end

end
