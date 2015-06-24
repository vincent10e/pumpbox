class CreateSelectOptions < ActiveRecord::Migration
  def change
    create_table :select_options do |t|
      t.integer :number
      t.string :label

      t.timestamps null: false
    end
  end
end
