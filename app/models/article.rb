class Article < ApplicationRecord

  # belongs_to :event
  # belongs_to :author
  # belongs_to :publisher

  # has_many :user_scores
  # has_many :saved_articles

  validates :title, :description, :body_text, presence: true
  validates :source_url, presence: true, uniqueness: true
end
