class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.integer :teacher_id
      t.string :title
      t.text :overview

      t.timestamps null: false
    end
  end
end
