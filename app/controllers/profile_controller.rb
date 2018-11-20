
class ProfileController < ApplicationController
  def show
    # Saved Articles
    @saved_article_ids = current_user.save_articles.map { |article| article.article_id }
    @all_articles = @saved_article_ids.map { |id| Article.find_by(id: id) }
    @articles = @all_articles.select { |article|  article.published = true }
    # Above line: Make sure only articles published are displayed

    # Following Lists
    @following_list = current_user.following_items
  end

  def editdebugging
    @user = current_user
  end

  def update

    if current_user.update(user_params)
      flash[:notice] = "Your profile has been updated"
      redirect_to root_path
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :first_name, :last_name, :photo)
  end

end
