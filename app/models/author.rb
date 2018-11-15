class Author < ApplicationRecord
  validates :first_name, presence: true
end
