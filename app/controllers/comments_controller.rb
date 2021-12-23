class CommentsController < ApplicationController
  def create
    post = Post.find(params[:post_id])
    comment = post.comments.new(text: comment_params[:text], user: current_user)

    respond_to do |format|
      format.html do
        if comment.save
          flash[:success] = 'Comment successfully created.'
          redirect_to user_post_path(post.user.id, post.id)
        else
          flash[:alert] = 'Error: comment is not published'
        end
      end
    end
  end

  def new
    @comment = Comment.new
  end

  def destroy
    @post = Post.find(params[:post_id])
    @user = User.find_by_id(@post.author_id)
    @comment = Comment.find_by_id(params[:id])
    if @comment.destroy
      flash[:success] = 'Comment successfully deleted.'
      redirect_to user_post_path(@user.id, @post.id)
    else
      flash[:alert] = 'Error: comment is not deleted.'
      redirect_back(fallback_location: root_path)
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:text)
  end
end
