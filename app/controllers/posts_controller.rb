class PostsController < ApplicationController
  load_and_authorize_resource except: [:create]

  def index
    @user = User.find(params[:user_id])
    @posts = @user.recent_posts
    @current_user = current_user
  end

  def show
    @user = User.find(params[:user_id])
    @post = @user.posts.includes(:comments).find(params[:id])
    @comments = @post.comments.all
    @current_user = current_user
  end

  def new
    @post = Post.new
    @current_user = current_user
  end

  def create
    @post = Post.new(params.require(:post).permit(:author_id, :title, :text, :comments_counter, :likes_counter))
    if @post.save
      flash[:success] = 'Post successfully created.'
      redirect_to user_post_path(@post.user.id, @post.id)
    else
      flash[:alert] = 'Error: post is not published'
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @user = User.find_by_id(@post.author_id)
    if @post.destroy
      flash[:success] = 'Post successfully deleted.'
      redirect_to user_posts_path(@user.id)
    else
      flash[:alert] = 'Error: post is not deleted.'
      redirect_back(fallback_location: root_path)
    end
  end

  private

  def posts_params
    params.require(:post).permit(:title, :text)
  end
end
