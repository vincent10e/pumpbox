class CreateCourseGroupships < ActiveRecord::Migration
  def change
    create_table :course_groupships do |t|
      t.integer :course_id
      t.integer :group_id

      t.timestamps null: false
    end
  end
end
