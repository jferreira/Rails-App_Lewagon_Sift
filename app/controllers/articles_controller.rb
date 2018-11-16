class ArticlesController < ApplicationController

  def index
  end

  def show
    # ARTICLE PASSED
    @article = Article.find(params[:id])

    # FIND EVENT INSTANCE
    event = @article.event
    events_articles = event.articles
    # DEFINE NEXT ARTICLE
    @next_article = Article.adjacent(events_articles, @article.id, :+)
    @prev_article = Article.adjacent(events_articles, @article.id, :-)

    # __
    # ALL ARTICLES WITH THE CURRENT EVENT
    #
    # 1. need to know what is the current article
    # 2. need to know what the event is of the current article
    @related_articles = events_articles
    # 3. need to find all the articles of that event and display them
    # 4. need to omit the current article from that list
    # 5. order by average user score

  end
end
