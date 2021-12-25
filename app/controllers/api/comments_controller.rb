class Api::CommentsController < ApplicationController
  load_and_authorize_resource
  protect_from_forgery with: :null_session, if: -> { request.format.json? }

  def index
    @comments = Comment.where({ post_id: params[:post_id] }).order('created_at')
    render json: { success: true, data: { comments: @comments } }
  end

  def create
    @post = Post.find(params[:post_id])
    @comment = Comment.new(text: comment_params[:text])
    @comment.author_id = current_user.id
    @comment.post_id = @post.id

    if @comment.save
      render json: { success: true, data: { comment: @comment } }, status: :created
    else
      render json: { success: false, errors: @comment.errors }, status: bad_request
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:text)
  end
end
