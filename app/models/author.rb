class Author < ApplicationRecord
  validates :first_name, presence: true

  has_many :articles

  include PgSearch
  multisearchable :against => [:first_name]

end
