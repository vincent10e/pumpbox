class AddColumnToTests < ActiveRecord::Migration
  def change
    rename_column :tests, :concept_id, :customized_concept_id
  end
end
