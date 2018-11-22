class FollowingItemsController < ApplicationController

  def create
    @following_item = FollowingItem.new(following_item)
    @following_item.user_id = current_user.id

    @followable = following_item[:follower_type].constantize.find(following_item[:follower_id])

    if @following_item.save
      respond_to do |format|
        format.html { redirect_back(fallback_path: root_path) }
        format.js
      end

    else
      respond_to do |format|
        format.html { render redirect_back(fallback_path: root_path) }
        format.js
      end
    end

  end


  def destroy
    @following_item = FollowingItem.find_by(id: params[:id])
    if @following_item.destory
      # flash[:notice] = "Item removed from your list"
      redirect_to article_path(@article)
    end
  end


  private


  def following_item
    params.require(:following_item).permit(:follower_type, :follower_id)
  end

end

