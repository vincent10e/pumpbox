class CreateTestPapers < ActiveRecord::Migration
  def change
    create_table :test_papers do |t|
      t.integer :customized_concept_id
      t.integer :user

      t.timestamps null: false
    end
  end
end
