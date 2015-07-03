class AddIsSkipToPaperAnswerRecord < ActiveRecord::Migration
  def change
    add_column :paper_answer_records, :is_skip, :boolean, default: false
  end
end
