class EventsController < ApplicationController
skip_before_action :authenticate_user!, :only => [:index, :show]

  def index
    @articles = Article.all
    @events = Event.all
  end

  def show

    @event = Event.find(params[:id])
    @events = Event.all

    @topic = Topic.find_by(id: @event.topic_id)
    @following_item = FollowingItem.new

    # TOPIC -------------------------------------------------
    topic_events = @topic.events

    # NEXT EVENT IN TOPIC
    @next_event = Event.adjacent(topic_events, @event.id, :+)
    @prev_event = Event.adjacent(topic_events, @event.id, :-)

  end

end
