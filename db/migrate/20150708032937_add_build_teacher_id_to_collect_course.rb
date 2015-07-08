class AddBuildTeacherIdToCollectCourse < ActiveRecord::Migration
  def change
    add_column :collect_courses, :build_teacher_id, :integer
  end
end
