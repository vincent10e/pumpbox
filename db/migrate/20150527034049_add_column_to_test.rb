class AddColumnToTest < ActiveRecord::Migration
  def change
    add_column :tests, :related_video, :string 
  end
end
