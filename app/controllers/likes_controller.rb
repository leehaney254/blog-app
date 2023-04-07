class LikesController < ApplicationController
  def create
    @post = params[:post_id]
    @user = current_user
    @like = @user.likes.new(post_id: @post)

    if @like.save
      redirect_to user_post_path(@user.id, @post), success: 'Liked successfully.'
    else
      redirect_to user_post_path(@user.id, @post), error: 'Sorry something went wrong'
    end
  end
end
