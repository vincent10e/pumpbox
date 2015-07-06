class AddRetryTimeToTestAttempt < ActiveRecord::Migration
  def change
   add_column :test_attempts, :retry_time, :integer, default: 1
  end
end
