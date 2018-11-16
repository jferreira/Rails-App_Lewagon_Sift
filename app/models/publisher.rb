class Publisher < ApplicationRecord

  validates :name, presence: true
  has_many :articles

  include PgSearch
  multisearchable :against => [:name]
end
