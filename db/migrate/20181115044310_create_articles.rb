class CreateArticles < ActiveRecord::Migration[5.2]
  def change
    create_table :articles do |t|
      t.string :title
      t.text :description
      t.text :body_text
      t.string :image_url
      t.string :source_url
      t.string :language
      t.string :location
      t.decimal :lat
      t.decimal :lng
      t.string :publishing_type
      t.datetime :date_time_published
      t.integer :count_views
      t.integer :average_user_score
      t.boolean :published
      t.references :publisher, foreign_key: true
      t.references :author, foreign_key: true
      t.references :event, foreign_key: true

      t.timestamps
    end
  end
end
