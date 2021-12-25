class UsersController < ApplicationController
  load_and_authorize_resource
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
    @user = User.new(user_params)
    return unless @user.save

    flash[:success] = 'Signed in successfully'
    redirect_to root_path
  end

  def edit
    current_user.update(user_params)
  end

  def admin?
    role == 'admin'
  end

  private

  def users_params
    params.require(:user).permit(:name, :bio, :photo, :posts_counter, :email, :password, :role)
  end
end
