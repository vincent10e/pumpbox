class AddSelectToPaperAnswerRecord < ActiveRecord::Migration
  def change
    add_column :paper_answer_records, :select_record_1, :string
    add_column :paper_answer_records, :select_record_2, :string
    add_column :paper_answer_records, :select_record_3, :string
    add_column :paper_answer_records, :select_record_4, :string
    add_column :paper_answer_records, :select_record_5, :string
  end
end
