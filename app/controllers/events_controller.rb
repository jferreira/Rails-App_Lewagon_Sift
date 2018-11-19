class EventsController < ApplicationController
  def index
    @articles = Article.all
    @events = Event.all
  end

  def show
    @event = Event.find(params[:id])
    @events = Event.all
  end

end
