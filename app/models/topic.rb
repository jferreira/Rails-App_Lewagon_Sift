class Topic < ApplicationRecord

  validates :name, presence: true
  has_many :events

  include PgSearch
  multisearchable :against => [:name]
end
