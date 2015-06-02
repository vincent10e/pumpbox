class AddColumnToCourse < ActiveRecord::Migration
  def change
    add_column :courses, :education_level_id, :integer
    add_column :courses, :subject_id, :integer
  end
end
