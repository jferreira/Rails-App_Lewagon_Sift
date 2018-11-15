class CreateFollowingItems < ActiveRecord::Migration[5.2]
  def change
    create_table :following_items do |t|
      t.references :follower, polymorphic: true
      # t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
