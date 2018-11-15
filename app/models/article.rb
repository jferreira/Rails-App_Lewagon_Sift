class Article < ApplicationRecord
  belongs_to :publisher
  belongs_to :author
  belongs_to :event
  validates :title, :description, :body_text, presence: true
  validates :source_url, presence: true, uniqueness: true
end
