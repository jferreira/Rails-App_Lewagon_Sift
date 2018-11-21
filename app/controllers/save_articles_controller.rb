class SaveArticlesController < ApplicationController

  before_action :set_article, only: [:create, :destroy]

  def create
    @saved_article = SaveArticle.new
    @saved_article.article_id = @article.id.to_i
    @saved_article.user_id = current_user.id

    @saved_article.save!
    redirect_to article_path(@article)
  end

  def destroy

    @saved_article = SaveArticle.find_by(id: params[:id])
    @saved_article.destroy!

    redirect_to article_path(@article)
  end

  private

  def set_article
    @article = Article.find_by(id: params[:article_id].to_i)
  end

end
