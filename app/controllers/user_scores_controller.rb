class UserScoresController < ApplicationController

  def create
    @article = Article.find(params[:article_id])
    @user_score = UserScore.new
    @user_score.score = 1
    @user_score.user_id = current_user.id
    @user_score.article_id = @article.id
    @user_score.save!
    redirect_to article_path(@article)
  end

  private

  def score_params
    params.require(:user_score).permit(:article_id)
  end
end
