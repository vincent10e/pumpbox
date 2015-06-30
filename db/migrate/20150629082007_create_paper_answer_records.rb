class CreatePaperAnswerRecords < ActiveRecord::Migration
  def change
    create_table :paper_answer_records do |t|
      t.integer :test_paper_id
      t.integer :test
      t.integer :error_times, default: 0

      t.timestamps null: false
    end
  end
end
