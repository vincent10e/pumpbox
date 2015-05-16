class AddLectureToConcepts < ActiveRecord::Migration
  def change
    add_column :concepts, :lecture, :string
  end
end
