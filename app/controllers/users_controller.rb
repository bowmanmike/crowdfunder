class UsersController < ApplicationController
  before_action :load_user, only: [:show, :edit, :update, :destroy]

  def index
    @users = User.all
  end

  def show
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to user_path(@user), notice: "Account created successfully"
    else
      render :new, notice: "Account not created"
    end
  end

  def edit
  end

  def update
    if @user.update_attributes(user_params)
      redirect_to user_path(@user), notice: "Profile updated succesfully"
    else
      render :edit, notice: "Profile not updated"
    end
  end

  def destroy
    @user.destroy
    redirect_to root_path, notice: "Account removed"
  end

  private
  def user_params
    params.require(:user).permit(:username, :email, :first_name, :last_name, :password_digest)
  end

  def load_user
    @user = User.find(params[:id])
  end

end
