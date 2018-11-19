class UserScoresController < ApplicationController

  def create

    @article = Article.find(params[:article_id])
    @user_score = UserScore.new(score_params)
    # @user_score.score = 1
    @user_score.user = current_user
    @user_score.article = @article
    @user_score.save!
    redirect_to article_path(@article)
  end

  private

  def score_params
    params.require(:user_score).permit(:article, :score)
  end
end
