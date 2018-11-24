class ArticlesController < ApplicationController
  skip_before_action :authenticate_user!, :only => [:index, :show]

  def index
    @articles = Article.page(params[:page])
    # @articles = Article.all
  end

  def show
    # ARTICLE PASSED
    @article = Article.find(params[:id])

    @average_score = @article.average_score

    @following_item = FollowingItem.new

    @event = Event.find_by(id: @article.event_id)

    @topic = Topic.find_by(id: @event.topic_id)
    @user_score = UserScore.new

    @save_article = SaveArticle.new

    # EVENT -------------------------------------------------
    @event_instance = @article.event
    events_articles = @event_instance.articles

    # NEXT & PREVIOUS ARTICLE IN EVENT
    @next_in_event = Article.adjacent(events_articles, @article.id, :+)
    @prev_in_event = Article.adjacent(events_articles, @article.id, :-)

    # TOPIC -------------------------------------------------
    @topic = @event_instance.topic
    topic_events = @topic.events

    # NEXT EVENT IN TOPIC
    @next_event = Event.adjacent(topic_events, @event_instance.id, :+)
    @prev_event = Event.adjacent(topic_events, @event_instance.id, :-)


    # ALL ARTICLES WITH THE CURRENT EVENT
    # 1. need to know what is the current article
    # 2. need to know what the event is of the current article
    # 3. need to find all the articles of that event and display them
    @related_articles = events_articles
    # 4. need to omit the current article from that list
    # 5. order by average user score
  end
end

# 908908
