class Article < ApplicationRecord

  belongs_to :event
  belongs_to :author
  belongs_to :publisher

  has_many :user_scores, dependent: :destroy
  has_many :save_articles, dependent: :destroy

  validates :title, :description, :body_text, presence: true
  validates :source_url, presence: true, uniqueness: true


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

  def average_score
    self.user_scores.pluck(:times_voted, :score).map { |x,y| x * y }.sum
  end

  include PgSearch
  multisearchable :against => [:title]

end
