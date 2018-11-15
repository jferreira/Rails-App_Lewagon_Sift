class CreateUserScores < ActiveRecord::Migration[5.2]
  def change
    create_table :user_scores do |t|
      t.integer :score
      t.references :article, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
