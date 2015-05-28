class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|
      t.integer :user_id
      t.string :username
      t.date   :birth
      t.string :school
      t.integer :gender
      t.integer :grade
      t.timestamps null: false
    end
  end
end
