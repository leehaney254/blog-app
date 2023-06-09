class CommentsController < ApplicationController
  load_and_authorize_resource

  def new
    @user = User.find_by(id: params[:user_id])
    @post = Post.find_by(id: params[:post_id])
    @comment = Comment.new
  end

  def create
    @user = current_user
    @post = Post.find_by(id: params[:post_id])
    @comment = Comment.new(comment_params)
    @comment.post = @post
    @comment.user = @user
    if @comment.save
      flash[:success] = 'Commented successfully.'
      redirect_to user_post_path(@user.id, @post.id)
    else
      flash.now[:error] = 'Sorry something went wrong'
      render :new
    end
  end

  def destroy
    @user = User.find(params[:user_id])
    @post = @user.posts.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
    if @comment.destroy
      flash[:notice] = 'Friend deleted successfully!'
    else
      flash[:alert] = 'Failed to delete friend'
    end

    redirect_to user_post_path(@user, @post)
  end

  def comment_params
    params.require(:comment).permit(:text)
  end
end
