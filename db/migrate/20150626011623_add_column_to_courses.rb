class AddColumnToCourses < ActiveRecord::Migration
  def change
    add_column :courses, :is_open, :boolean, default: false
  end
end
