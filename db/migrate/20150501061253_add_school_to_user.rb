class AddSchoolToUser < ActiveRecord::Migration
  def change
  	add_column :users, :school, :string
  	add_column :users, :grade, :integer
  end
end
