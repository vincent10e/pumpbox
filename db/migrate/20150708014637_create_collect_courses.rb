class CreateCollectCourses < ActiveRecord::Migration
  def change
    create_table :collect_courses do |t|
      t.integer :teacher_id
      t.string :title
      t.text :overview
      t.integer :education_level_id
      t.integer :subject_id
      t.integer :group_id
      t.integer :volume_id
      t.string :image
      t.boolean :is_open

      t.timestamps null: false
    end
  end
end
