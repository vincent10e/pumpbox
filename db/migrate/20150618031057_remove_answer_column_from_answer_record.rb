class RemoveAnswerColumnFromAnswerRecord < ActiveRecord::Migration
  def change
    remove_column :answer_records, :answer, :integer
  end
end
