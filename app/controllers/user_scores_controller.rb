class UserScoresController < ApplicationController

  def create
    @article = Article.find(params[:article_id])
    @user_score = UserScore.find_or_create(@article.id, current_user.id)
    @user_score.score = @user_score.score.to_i + score_params[:score].to_i
    @user_score.times_voted += 1

    @user_score.save!
    redirect_to article_path(@article)
  end

  private

  def score_params
    params.require(:user_score).permit(:score)
  end
end
