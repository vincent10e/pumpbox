class CreateTestAttempts < ActiveRecord::Migration
  def change
    create_table :test_attempts do |t|
      t.integer :customized_concept_id
      t.integer :user

      t.timestamps null: false
    end
  end
end
