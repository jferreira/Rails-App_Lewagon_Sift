class Event < ApplicationRecord
  belongs_to :topic
  validates :name, presence: true
  has_many :articles
end


