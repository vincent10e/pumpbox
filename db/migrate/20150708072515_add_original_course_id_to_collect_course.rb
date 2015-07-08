class AddOriginalCourseIdToCollectCourse < ActiveRecord::Migration
  def change
    add_column :collect_courses, :original_course_id, :integer
  end
end
