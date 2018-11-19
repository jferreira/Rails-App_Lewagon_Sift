class AddTimesVotedToUserScores < ActiveRecord::Migration[5.2]
  def change
    add_column :user_scores, :times_voted, :integer, default: 0
  end
end
