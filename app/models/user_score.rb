class UserScore < ApplicationRecord
  validates :score, presence: true

  belongs_to :article
  belongs_to :user
end
