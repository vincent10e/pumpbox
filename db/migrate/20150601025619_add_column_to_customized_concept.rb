class AddColumnToCustomizedConcept < ActiveRecord::Migration
  def change
    add_column :customized_concepts , :test_question, :text
    add_column :customized_concepts, :test_tip, :string
    add_column :customized_concepts, :test_related_video, :string
    add_column :customized_concepts, :option_1, :string
    add_column :customized_concepts, :option_2, :string
    add_column :customized_concepts, :option_3, :string
    add_column :customized_concepts, :option_4, :string
    add_column :customized_concepts, :option_1_is_answer, :boolean
    add_column :customized_concepts, :option_2_is_answer, :boolean
    add_column :customized_concepts, :option_3_is_answer, :boolean
    add_column :customized_concepts, :option_4_is_answer, :boolean
  end
end
