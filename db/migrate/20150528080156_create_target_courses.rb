class CreateTargetCourses < ActiveRecord::Migration
  def change
    create_table :target_courses do |t|
      t.string :title

      t.timestamps null: false
    end
  end
end
