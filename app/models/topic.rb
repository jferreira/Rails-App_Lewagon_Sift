class Topic < ApplicationRecord

  validates :name, presence: true
  has_many :events, dependent: :destroy

  include PgSearch
  multisearchable :against => [:name]
end
