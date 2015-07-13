class AddCityToStudents < ActiveRecord::Migration
  def change
    add_column :students, :city, :string
    add_column :students, :district, :string
  end
end
