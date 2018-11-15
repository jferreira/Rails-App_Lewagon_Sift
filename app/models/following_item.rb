class FollowingItem < ApplicationRecord
  belongs_to :follower, polymorphic: true
  belongs_to :user
end
