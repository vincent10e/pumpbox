class AddTargetCourseIdToSubject < ActiveRecord::Migration
  def change
    add_column :subjects, :target_course_id, :integer
  end
end
