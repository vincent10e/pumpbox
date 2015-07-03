class AddRetryTimeToTestPaper < ActiveRecord::Migration
  def change
    add_column :test_papers, :retry_time, :integer, default: 1
  end
end
