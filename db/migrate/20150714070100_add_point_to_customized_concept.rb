class AddPointToCustomizedConcept < ActiveRecord::Migration
  def change
    add_column :customized_concepts, :point, :integer, default: 10
  end
end
