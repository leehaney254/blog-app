class PostsController < ApplicationController
  def index
    @id = params[:user_id]
    @posts = User.find(@id).posts
    @user = User.find(@id)
  end

  def show
    @post = Post.find(params[:id])
    @comments = @post.comments
  end
end
