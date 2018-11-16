class TopicsController < ApplicationController
  def index
    @topic = Topic.third
    if params[:query].present?
      @documents = PgSearch.multisearch(params[:query]).limit(10)
    else
      @documents = @topic.events
    end
  end

  def show
  end

end
