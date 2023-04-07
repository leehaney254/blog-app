class PostsController < ApplicationController
  def index
    @id = params[:user_id]
    @pagy, @posts = pagy(User.find(@id).posts, items: 2)
    @user = User.find(@id)
  end

  def show
    @post = Post.find(params[:id])
    @comments = @post.comments
  end

  def new
    @post = Post.new
  end

  def create

  end
end
