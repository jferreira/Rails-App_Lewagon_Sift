class Author < ApplicationRecord
  validates :first_name, presence: true
  has_many :articles
end
