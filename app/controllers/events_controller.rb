class EventsController < ApplicationController
skip_before_action :authenticate_user!, :only => [:index, :show]

  def index
    @articles = Article.all
    @events = Event.all
  end

  def show
    @event = Event.find(params[:id])
    @events = Event.all
  end

end
