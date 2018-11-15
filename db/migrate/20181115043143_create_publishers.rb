class CreatePublishers < ActiveRecord::Migration[5.2]
  def change
    create_table :publishers do |t|
      t.string :name
      t.text :description
      t.string :image_url
      t.string :web_url
      t.string :location
      t.decimal :lat
      t.decimal :lng

      t.timestamps
    end
  end
end
