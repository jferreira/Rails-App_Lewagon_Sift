class Publisher < ApplicationRecord

  validates :name, presence: true
  has_many :articles, dependent: :destroy

  include PgSearch
  multisearchable :against => [:name]
end
