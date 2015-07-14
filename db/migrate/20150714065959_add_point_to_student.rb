class AddPointToStudent < ActiveRecord::Migration
  def change
    add_column :students, :point, :integer, default: 0
  end
end
