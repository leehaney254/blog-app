class PostsController < ApplicationController
  def index
    @id = params[:user_id]
    @pagy, @posts = pagy(User.find(@id).posts, items: 2)
    @user = User.find(@id)
  end

  def show
    @user = User.find(params[:user_id])
    @post = Post.find(params[:id])
    @comments = @post.comments
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
      title: params[:post][:title],
      text: params[:post][:text],
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
end
