class AddIndexesToLevelsAndMaterials < ActiveRecord::Migration[5.0]
  def change
    add_index :levels, [:procedure_id, :stage_id], unique: true, using: :btree
    add_index :materials, [:stage_id, :document_id], unique: true, using: :btree
  end
end
