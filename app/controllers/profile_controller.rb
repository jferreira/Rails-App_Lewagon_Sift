class ProfileController < ApplicationController
  def show
    @saved_article_ids = current_user.save_articles.map { |article| article.article_id }
    @all_articles = @saved_article_ids.map { |id| Article.find_by(id: id) }
    @articles = @all_articles.select { |article|  article.published = true }
    # Above line: Make sure only articles published are displayed
  end
end
