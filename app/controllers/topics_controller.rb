class TopicsController < ApplicationController
  def index
    if params[:query].present?
      @documents = PgSearch.multisearch(params[:query]).limit(10)
      @articles = Article.all
      @topics = Topic.all
    else
      @documents = []
      @articles = Article.all
      @topics = Topic.all
    end
  end

  def show
  end

end
