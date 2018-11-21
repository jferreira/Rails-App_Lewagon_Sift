class Event < ApplicationRecord

  validates :name, presence: true

  belongs_to :topic
  has_many :articles, dependent: :destroy

  def self.adjacent(collection, current_id, direction)
    ids = collection.pluck(:id)
    current_index = ids.index(current_id)
    adjacent_index = (current_index.send(direction, 1)) % ids.length
    adjacent_id = ids[adjacent_index]
    self.find(adjacent_id)
  end

  include PgSearch
  multisearchable :against => [:name]
end


