class AddTestTimeSecToTestPaper < ActiveRecord::Migration
  def change
    add_column :test_papers, :test_time_sec, :integer
  end
end
