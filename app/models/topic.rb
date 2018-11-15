class Topic < ApplicationRecord

  validates :name, presence: true
  has_many :events

end
