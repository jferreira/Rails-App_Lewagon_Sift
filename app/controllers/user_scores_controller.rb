class UserScoresController < ApplicationController

  def new
    @user_score = UserScore.new
  end

  def create
  end
end
