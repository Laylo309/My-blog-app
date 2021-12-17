class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @posts = @user.recent_posts
  end

  def show
    @user = User.find(params[:user_id])
    @post = @user.posts.find(params[:id])
    @comments = @post.comments.all
  end

  def new
    @post = Post.new
    @current_user = current_user
  end

  def create
    @post = Post.new(params.require(:post).permit(:author_id, :title, :text, :comments_counter, :likes_counter))

    respond_to do |format|
      format.html do
        redirect_to user_post_path(@post.user.id, @post.id) if @post.save
      end
    end
  end
end
