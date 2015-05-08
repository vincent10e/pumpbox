class AddGradeColumnToStudent < ActiveRecord::Migration
  def change
  	add_column :students, :grade_cd, :integer
  end
end
