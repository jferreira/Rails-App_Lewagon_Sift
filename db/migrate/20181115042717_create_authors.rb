class CreateAuthors < ActiveRecord::Migration[5.2]
  def change
    create_table :authors do |t|
      t.string :first_name
      t.string :last_name
      t.string :twitter_handle
      t.string :location
      t.decimal :lat
      t.decimal :lng

      t.timestamps
    end
  end
end
