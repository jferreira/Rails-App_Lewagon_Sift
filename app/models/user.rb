class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :following_items, dependent: :destroy
  has_many :save_articles, dependent: :destroy
  has_many :user_scores, dependent: :destroy

  def can_user_vote(article_id)
    self.user_scores.where(article_id: article_id).length <= 4
  end

end
