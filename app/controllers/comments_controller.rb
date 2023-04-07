class CommentsController < ApplicationController

  def new
    @user = User.find_by(id: params[:user_id])
    @post = Post.find_by(id: params[:post_id])
    @comment = Comment.new
  end

  def create
    @user = current_user
    @post = Post.find_by(id: params[:post_id])
    @comment = Comment.new(
      post: @post,
      user: @user,
      text: params[:comment][:comment],
    )
    if @comment.save
      flash[:success] = "Commented successfully."
      redirect_to user_post_path(@user.id, @post.id)
    else
      flash.now[:error] = "Sorry something went wrong"
      render :new
    end
  end
end