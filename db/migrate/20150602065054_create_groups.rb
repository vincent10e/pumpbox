class CreateGroups < ActiveRecord::Migration
  def change
    create_table :groups do |t|
      t.integer :teacher_id
      t.string :name
      t.string :group_code

      t.timestamps null: false
    end
  end
end
