class CommentsController < ApplicationController
  def index

  end

  def new
    @comment = Comment.new
  end

  def show

  end

  def create
    @comment = @project.comments.build(comment_params)
    @comment.user = current_user

  end

  def update
  end

  def destroy
  end

  private

  def comment_params
    params.require(:comment).permit(:comment)
  end
end
