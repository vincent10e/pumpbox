class CreateCustomizedConcepts < ActiveRecord::Migration
  def change
    create_table :customized_concepts do |t|
      t.integer :course_id
      t.string :title
      t.text :description
      t.string :video
      t.string :lecture

      t.timestamps null: false
    end
  end
end
