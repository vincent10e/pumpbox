class RemoveColumnToCustomizedConcepts < ActiveRecord::Migration
  def change
    remove_column :customized_concepts, :option_1
    remove_column :customized_concepts, :option_2
    remove_column :customized_concepts, :option_3
    remove_column :customized_concepts, :option_4
    remove_column :customized_concepts, :option_1_is_answer
    remove_column :customized_concepts, :option_2_is_answer
    remove_column :customized_concepts, :option_3_is_answer
    remove_column :customized_concepts, :option_4_is_answer
  end
end
