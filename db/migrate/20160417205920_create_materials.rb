class CreateMaterials < ActiveRecord::Migration[5.0]
  def change
    create_table :materials do |t|
      t.belongs_to :stage, null: false
      t.belongs_to :document, null: false

      t.timestamps null: false
    end
  end
end
