class CreateConcepts < ActiveRecord::Migration
  def change
    create_table :concepts do |t|
      t.integer :subject_id
      t.integer :volume_number
      t.integer :chapter_id
      t.string :title
      t.text :description
      t.string :video

      t.timestamps null: false
    end
  end
end
