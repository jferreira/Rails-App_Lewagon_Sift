class UserscoreController < ApplicationController
    def new
    @user_score = UserScore.new
    raise
  end

  def create

    # @user_score = UserScore.new() ### user id, article id, score

    # @review.user_score = @user_score
    # if @review.save
    #   redirect_to user_score_path(@user_score)
    # else
    #   render 'articles/show'
    # end
  end
end
