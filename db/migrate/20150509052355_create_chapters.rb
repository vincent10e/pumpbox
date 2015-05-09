class CreateChapters < ActiveRecord::Migration
  def change
    create_table :chapters do |t|
      t.integer :volume_number
      t.integer :subject_id
      t.string :title
      t.text :description

      t.timestamps null: false
    end
  end
end
