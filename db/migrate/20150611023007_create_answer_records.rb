class CreateAnswerRecords < ActiveRecord::Migration
  def change
    create_table :answer_records do |t|
      t.integer :test_attempt_id
      t.integer :test
      t.integer :answer
      t.integer :error_times, default: 0

      t.timestamps null: false
    end
  end
end
