class CreateVolumes < ActiveRecord::Migration
  def change
    create_table :volumes do |t|
      t.string :title
      t.integer :number
      t.string :education_level_id

      t.timestamps null: false
    end
  end
end
