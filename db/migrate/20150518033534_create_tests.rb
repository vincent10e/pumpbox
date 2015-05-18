class CreateTests < ActiveRecord::Migration
  def change
    create_table :tests do |t|
      t.integer :concept_id
      t.string :question
      t.string :tip

      t.timestamps null: false
    end
  end
end
