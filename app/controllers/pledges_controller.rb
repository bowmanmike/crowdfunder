class PledgesController < ApplicationController
  def index
    @pledges = Pledge.all
  end

  def new
    @pledges = Pledge.new
  end

  def create
    @pledge = Pledge.new(pledge_params)

    if @pledge.save
      redirect_to pledges_path, notice: "Pledge successfully submitted!"
    else
      render :new
    end
  end

  private
  def pledge_params
    params.require(:pledge).permit(:amount)
  end
end
