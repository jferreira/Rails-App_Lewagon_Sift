class Topic < ApplicationRecord

  validates :name, presence: true
  has_many :events, dependent: :destroy

  def self.adjacent(collection, current_id, direction)
    # Taking an array of id's, from collection(articles)
    ids = collection.pluck(:id)
    # Taking the current article id and finding its index
    current_index = ids.index(current_id)
    # taking that index and its direction either -1 or +1, whilest checking not to excede the array. giving back an index
    adjacent_index = (current_index.send(direction, 1)) % ids.length
    # returning the id of the an ajacent aricle from the index passed
    adjacent_id = ids[adjacent_index]
    # then fining the instance in the database
    self.find(adjacent_id)
  end

  include PgSearch
  multisearchable :against => [:name]
end
