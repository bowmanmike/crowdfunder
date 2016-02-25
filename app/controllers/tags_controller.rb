class TagsController < ApplicationController
  before_action :load_tag, only: [:show, :edit, :update, :destroy]

  def index
    @tags = Tag.all
  end

  def show
  end

  def new
    @tag = Tag.new
  end

  def create
    @tag = Tag.new(tag_params)
    # figure out how to titleize name before it is saved to the db

    if @tag.save
      redirect_to tags_path, notice: "Tag created successfully"
    else
      render :new, notice: "Tag not created"
    end
  end

  def edit
  end

  def update
    if @tag.update_attributes(tag_params)
      redirect_to tag_path(@tag), notice: "Tag updated"
    end
  end

  def destroy
    @tag.destroy
    redirect_to tags_path, notice: "Tag removed"
  end

  private
  def tag_params
    params.require(:tag).permit(:name)
  end

  def load_tag
    @tag = Tag.find(params[:id])
  end

end
