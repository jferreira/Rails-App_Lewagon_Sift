class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    if params[:query].present?
      @documents = PgSearch.multisearch(params[:query]).limit(10)
      @articles = Article.all
    else
      @documents = []
      @articles = Article.all
    end
  end

end
