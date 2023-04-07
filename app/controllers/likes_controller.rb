class LikesController < ApplicationController
  def create
    @post = params[:post_id]
    @user = current_user
    @like = @user.likes.new(post_id: @post)

    if @like.save
      flash[:success] = 'Liked successfully.'
      redirect_to user_post_path(@user.id, @post)
    else
      flash.now[:error] = 'Sorry something went wrong'
      redirect_to user_post_path(@user.id, @post)
    end
  end
end
