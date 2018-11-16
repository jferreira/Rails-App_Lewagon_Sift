class TopicsController < ApplicationController
  def index
    @topic = Topic.third
    @events = @topic.events
  end

  def show
  end

end
