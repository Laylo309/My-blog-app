class UsersController < ApplicationController
  def index
    @users = User.all
    @current_user = current_user
  end

  def show
    @user = User.find(params[:id])
    @posts = @user.recent_posts
    @current_user = current_user
  end

  def create
    @user = User.create(user_params)
  end

  def edit
    current_user.update(user_params)
  end

  private

  def users_params
    params.require(:user).permit(:name, :bio, :photo, :posts_counter, :email, :password)
  end
end
