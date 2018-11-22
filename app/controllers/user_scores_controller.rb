class UserScoresController < ApplicationController

  def create
    @article = Article.find(params[:article_id])
    @user_score = UserScore.find_or_create(@article.id, current_user.id)
    @user_score.score = @user_score.score.to_i + score_params[:score].to_i
    @user_score.times_voted += 1
    @article_avg = @article.average_score

    if @user_score.save
      respond_to do |format|
        format.html { redirect_to article_path(@article) }
        format.js
      end
    else
      respond_to do |format|
        format.html { redirect_to article_path(@article) }
        format.js
      end
    end

  end

  private

  def score_params
    params.require(:user_score).permit(:score)
  end
end
