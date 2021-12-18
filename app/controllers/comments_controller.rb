class CommentsController < ApplicationController
  def create
    post = Post.find(params[:post_id])
    comment = post.comments.new(text: comment_params[:text], user: current_user)

    respond_to do |format|
      format.html do
        if comment.save
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

  private

  def comment_params
    params.require(:comment).permit(:text)
  end
end
