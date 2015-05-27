class ChangTestColumn < ActiveRecord::Migration
  def change
    change_column :tests, :question, :text
  end
end
