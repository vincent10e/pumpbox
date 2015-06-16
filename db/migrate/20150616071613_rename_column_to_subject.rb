class RenameColumnToSubject < ActiveRecord::Migration
  def change
    rename_column :subjects, :target_course_id, :education_level_id
  end
end
