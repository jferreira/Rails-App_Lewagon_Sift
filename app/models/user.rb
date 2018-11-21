class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :following_items, dependent: :destroy
  has_many :save_articles, dependent: :destroy
  has_many :user_scores, dependent: :destroy

  def can_user_vote(article_id)
    result = self.user_scores.find_by(article_id: article_id)
    result.nil? ? true : result.times_voted <= 4
  end

  def article_saved?(article_id)
    save_articles.find_by(article_id: article_id)
  end

  def return_unique_items
    following_items.uniq { |m| "#{ m[:follower_type] }-#{ m[:follower_id] }" }
  end
end
