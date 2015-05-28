class AddTargetCourseIdToConcept < ActiveRecord::Migration
  def change
    add_column :concepts, :target_course_id, :integer
  end
end
