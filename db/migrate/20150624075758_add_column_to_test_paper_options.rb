class AddColumnToTestPaperOptions < ActiveRecord::Migration
  def change
    add_column :test_paper_options, :question_number, :integer
  end
end
