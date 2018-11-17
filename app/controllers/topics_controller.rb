class TopicsController < ApplicationController
  def index
    if params[:query].present?
      @documents = PgSearch.multisearch(params[:query]).limit(10)
    else
      @documents = []
      @articles = Article.all
    end
  end

  def show
  end

end
