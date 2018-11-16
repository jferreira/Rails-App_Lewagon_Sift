class ArticlesController < ApplicationController

  def index
  end

  def show
    @article = Article.find(params[:id])

    # FIND EVENT INSTANCE
    event = @article.event
    events_articles = event.articles
    # DEFINE NEXT ARTICLE
    @next_article = Article.adjacent(events_articles, @article.id, :+)
    @prev_article = Article.adjacent(events_articles, @article.id, :-)

  end
end
