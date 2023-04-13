class PostsController < ApplicationController
  def index
    @id = params[:user_id]
    @user = User.find(@id)
    @pagy, @posts = pagy(@user.posts.includes(comments: [:user]), items: 2)
  end

  def show
    @user = User.find(params[:user_id])
    @post = Post.includes(comments: [:user]).find(params[:id])
    @like = Like.new
  end

  def new
    @post = Post.new
    @user = current_user
  end

  def create
    @user = current_user
    @post = Post.new(
      author: @user,
      title: params[:title],
      text: params[:text],
      comments_counter: 0,
      likes_counter: 0
    )
    if @post.save
      flash[:success] = 'Post saved successfully.'
      redirect_to user_path(@user.id)
    else
      flash.now[:error] = 'Sorry something went wrong'
      render :new
    end
  end

  def destroy
    @post = Post.find(params[:id])
    if @post.destroy
      flash[:notice] = "Friend deleted successfully!"
    else
      flash[:alert] = "Failed to delete friend"
    end
    redirect_to user_path(@user.id)
  end
end
