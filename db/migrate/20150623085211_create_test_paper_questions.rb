class CreateTestPaperQuestions < ActiveRecord::Migration
  def change
    create_table :test_paper_questions do |t|
      t.integer :customized_concept_id
      t.string :question

      t.timestamps null: false
    end
  end
end
