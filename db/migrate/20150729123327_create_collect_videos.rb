class CreateCollectVideos < ActiveRecord::Migration
  def change
    create_table :collect_videos do |t|
      t.integer :user_id
      t.string :title
      t.string :url

      t.timestamps null: false
    end
  end
end
