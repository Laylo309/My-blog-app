class PostsController < ApplicationController
  def index
  @user = User.find(params[:user_id])
   @posts = @user.recent_posts
  end

  def show
  @post = @user.posts.find(params[:id])
   @user = User.find(params[:user_id])
   @comments = @post.comments.all
  end
end
