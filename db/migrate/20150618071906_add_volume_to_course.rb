class AddVolumeToCourse < ActiveRecord::Migration
  def change
    add_column :courses, :volume_id, :integer
  end
end
