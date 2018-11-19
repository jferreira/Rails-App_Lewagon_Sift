class EventsController < ApplicationController
  def index
    @articles = Article.all
  end

  def show
    @event = Event.find(params[:id])
  end
end
