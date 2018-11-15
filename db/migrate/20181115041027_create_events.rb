class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.string :name
      t.string :image_url
      t.datetime :date_time
      t.string :location
      t.decimal :lat
      t.decimal :lng
      t.references :topic, foreign_key: true

      t.timestamps
    end
  end
end
