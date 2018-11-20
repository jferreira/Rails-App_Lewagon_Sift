class UserScore < ApplicationRecord
  validates :score, presence: true

  belongs_to :article
  belongs_to :user

  def self.find_or_create(article_id, user_id)
    score = UserScore.find_by(article_id: article_id, user_id: user_id)
    score ? score : UserScore.new(article_id: article_id, user_id: user_id)
  end

end
