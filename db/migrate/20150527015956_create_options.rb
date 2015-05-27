class CreateOptions < ActiveRecord::Migration
  def change
    create_table :options do |t|
      t.integer :test_id
      t.string :description
      t.boolean :is_answer

      t.timestamps null: false
    end
  end
end
