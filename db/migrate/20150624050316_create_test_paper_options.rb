class CreateTestPaperOptions < ActiveRecord::Migration
  def change
    create_table :test_paper_options do |t|
      t.integer :test_paper_question_id
      t.integer :answer

      t.timestamps null: false
    end
  end
end
