class AddTestTimeSecToTestAttempt < ActiveRecord::Migration
  def change
    add_column :test_attempts, :test_time_sec, :integer
  end
end
