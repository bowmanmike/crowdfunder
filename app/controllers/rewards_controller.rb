class RewardsController < ApplicationController
  before_action :load_reward, only: [:show, :edit, :update, :destroy]
  before_action :load_project

  def index
    @rewards = Reward.all
  end

  def show
  end

  def new
    @reward = Reward.new
  end

  def create
    @reward = @project.rewards.build(reward_params)
    if @reward.save
      redirect_to project_path(@project), notice: "Reward added"
    else
      render :new, notice: "Reward not created"
    end
  end

  def edit
  end

  def update
    if @reward.update_attributes(reward_params)
      redirect_to project_path(@project), notice: "Reward updated"
    else
      render :edit, notice: "Reward not updated"
    end
  end

  def destroy
    @reward.destroy
    redirect_to project_path(@project), notice: "Reward deleted"
  end

  private
  def reward_params
    params.require(:reward).permit(:name, :price, :description, :number_available)
  end

  def load_project
    @project = Project.find(params[:project_id])
  end

  def load_reward
    @reward = Reward.find(params[:id])
  end

end
