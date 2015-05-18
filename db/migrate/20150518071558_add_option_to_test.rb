class AddOptionToTest < ActiveRecord::Migration
  def change
    add_column :tests, :option_1, :string
    add_column :tests, :option_2, :string
    add_column :tests, :option_3, :string
    add_column :tests, :option_4, :string
    add_column :tests, :answer, :string
  end
end
