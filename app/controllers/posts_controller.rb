class PostsController < ApplicationController
  def index
    @posts = Post.all
    @id = params[:user_id]
    @user = User.find(@id)
  end

  def show
    @post = Post.find(params[:id])
    @comments = @post.comments
  end
end
