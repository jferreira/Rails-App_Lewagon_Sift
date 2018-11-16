class TopicsController < ApplicationController
  def index
    @topic = Topic.third
    if params[:query].present?
      @events = PgSearch.multisearch(params[:query])
    else
      @events = @topic.events
    end
  end

  def show
  end

end
