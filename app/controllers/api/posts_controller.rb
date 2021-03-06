class Api::PostsController < ApplicationController
  load_and_authorize_resource

  def index
    @post = Post.all.order('created_at')
    render json: { success: true, data: { posts: @posts } }
  end
end
