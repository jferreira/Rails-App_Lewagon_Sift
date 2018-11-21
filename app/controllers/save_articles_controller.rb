class SaveArticlesController < ApplicationController
  def create

    @article = Article.find_by(id: params[:article_id].to_i)

    @saved_article = SaveArticle.new
    @saved_article.article_id = @article.id.to_i
    @saved_article.user_id = current_user.id

    @saved_article.save!
    redirect_to article_path(@article)
  end

end
