class FollowingItemsController < ApplicationController
  def create
    @followingitem = FollowingItem.new(item_params)
    @followingitem.user_id = current_user.id

    @article = Article.find(params[:article_id])

    @followingitem.save!
    redirect_to article_path(@article)
  end

  private

  def item_params
    params.require(:following_item).permit(:follower_type, :follower_id)
  end
end

