class CreateTeachers < ActiveRecord::Migration
  def change
    create_table :teachers do |t|
      t.integer :user_id
      t.string :username
      t.string :service_unit
      t.date   :birth
      t.integer :gender
      t.string :suject
      t.timestamps null: false
    end
  end
end
