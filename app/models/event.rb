class Event < ApplicationRecord

  validates :name, presence: true

  belongs_to :topic
  has_many :articles, dependent: :destroy

  include PgSearch
  multisearchable :against => [:name]
end


