class AddIsCollectToCourse < ActiveRecord::Migration
  def change
    add_column :courses, :is_collect, :boolean, default: false
  end
end
