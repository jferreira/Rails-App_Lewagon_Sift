class Event < ApplicationRecord

  validates :name, presence: true

  belongs_to :topic
  has_many :articles

  include PgSearch
  multisearchable :against => [:name]
end


