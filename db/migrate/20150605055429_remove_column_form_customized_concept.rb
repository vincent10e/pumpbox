class RemoveColumnFormCustomizedConcept < ActiveRecord::Migration
  def change
    remove_column :customized_concepts, :test_question, :text
    remove_column :customized_concepts, :test_tip, :string
    remove_column :customized_concepts, :test_related_video, :string
  end
end
